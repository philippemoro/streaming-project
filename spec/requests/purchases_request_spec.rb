# frozen_string_literal: true

require 'rails_helper'

describe 'Purchases', type: :request do
  describe 'POST /contents/:content_id/purchase_options/:purchase_option_id/purchase' do
    let(:json_response) { JSON.parse(response.body) }
    let(:user) { create(:user) }
    let(:content) { create(:content) }
    let(:purchase_option) { create(:purchase_option, content: content) }
    let(:params) { { user_id: user.id } }

    context 'with valid params' do
      before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }

      let(:hash_match) do
        hash_including(
          'attributes' => hash_including(
            'id',
            'purchase_option_id',
            'created_at',
            'user_id',
            'price',
            'updated_at'
          ),
          'relationships' => hash_including(
            'user',
            'purchase_option',
            'coupon'
          )
        )
      end

      it 'creates the purchase' do
        expect(response.code).to eq('200')
        expect(json_response['data']).to match(hash_match)
      end

      context 'with valid coupon' do
        let!(:coupon) { create(:coupon) }
        let(:params) { { user_id: user.id, coupon_code: coupon.code } }

        it 'creates the purchase' do
          expect(response.code).to eq('200')
          expect(json_response['data']).to match(hash_match)
          expect(json_response['data']['attributes']['price']).to eq("0.0")
        end

        it { expect(coupon.reload).not_to be_active }
      end
    end

    context 'with invalid params' do
      context 'when user_id is invalid' do
        before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }

        let(:params) { { user_id: 'invalid_user_id' } }

        it 'returns invalid user error' do
          expect(response.code).to eq('422')
          expect(json_response['message']).to eq('Validation failed: User must exist')
        end
      end

      context 'when user already have that content available' do
        let!(:purchase) { create(:purchase, user: user, purchase_option: purchase_option) }

        before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }

        it 'retuns content already purchased error' do
          expect(response.code).to eq('422')
          expect(json_response['message']).to eq('Validation failed: Content already purchased')
        end
      end

      context 'with an redeemed coupon' do
        before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }
        let!(:coupon) { create(:redeemed_coupon) }
        let(:params) { { user_id: user.id, coupon_code: coupon.code } }

        it 'creates the purchase' do
          expect(response.code).to eq('422')
          expect(json_response['message']).to eq('Validation failed: Coupon already redeemed')
        end

        it { expect(coupon.reload).not_to be_active }
      end

      context 'with an invalid coupon' do
        before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }
        let!(:coupon) { create(:redeemed_coupon) }
        let(:params) { { user_id: user.id, coupon_code: 'potato' } }

        it 'creates the purchase' do
          expect(response.code).to eq('404')
          expect(json_response['message']).to eq('Couldn\'t find Coupon')
        end

        it { expect(coupon.reload).not_to be_active }
      end
    end
  end
end
