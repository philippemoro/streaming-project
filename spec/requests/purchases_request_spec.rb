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
          'id',
          'purchase_option_id',
          'created_at',
          'user_id',
          'price',
          'updated_at'
        )
      end

      it 'creates the purchase' do
        expect(response.code).to eq('200')
        expect(json_response).to match(hash_match)
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
    end
  end
end
