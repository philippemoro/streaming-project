# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :request do
  describe 'GET /library' do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:purchases) { create_list(:purchase, 5, user: user) }
    let!(:other_purchases) { create_list(:purchase, 5, user: user2) }
    let!(:expired_purchases) { create_list(:expired_purchase, 5, user: user) }
    let(:json_response) { JSON.parse(response.body)['data'] }

    before { get "/users/#{user.id}/library" }

    it 'returns all the user alive_purchases ' do
      expect(response).to have_http_status(200)
      expect(json_response.size).to eq(5)
      expect(json_response.map { |x| x['id'] }).to match_array(user.alive_purchases.all.pluck(:id))
    end
  end
end
