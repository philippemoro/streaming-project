# frozen_string_literal: true

require 'rails_helper'

describe 'Purchases', type: :request do
  describe 'POST /contents/:content_id/purchase_options/:purchase_option_id/purchase' do
    let(:json_response) { JSON.parse(response.body) }
    let(:user) { create(:user) }
    let(:content) { create(:movie_content) }
    let(:purchase_option) { create(:purchase_option, content: content) }

    before { post "/contents/#{content.id}/purchase_options/#{purchase_option.id}/purchases", params: params }

    context 'with valid params' do
      let(:params) { { user_id: user.id } }
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
      let(:params) { { user_id: 'invalid_user_id' } }

      it 'returns an error' do
        expect(response.code).to eq('422')
        expect(json_response['message']).to eq('Validation failed: User must exist')
      end
    end
  end
end
