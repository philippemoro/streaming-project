# frozen_string_literal: true

require 'rails_helper'

describe 'Seasons', type: :request do
  describe 'GET /seasons' do
    let!(:seasons) { create_list(:season, 10, :with_episodes) }
    let(:json_response) { JSON.parse(response.body) }

    before { get '/seasons' }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns seasons' do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
      expect(json_response.map { |x| x['id'] }).to match_array(Season.all.pluck(:id))
    end

    it 'returns the episodes of each season' do
      expect(json_response.first['episodes']).not_to be_empty
      expect(json_response.first['episodes'].size).to eq(3)
    end
  end
end
