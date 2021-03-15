# frozen_string_literal: true

require 'rails_helper'

describe 'Movies', type: :request do
  describe 'GET /movies' do
    let!(:movies) { create_list(:movie, 10) }
    let(:json_response) { JSON.parse(response.body) }

    before { get '/movies' }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns movies' do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
      expect(json_response.map { |x| x['id'] }).to match_array(Movie.all.pluck(:id))
    end
  end
end
