# frozen_string_literal: true

require 'rails_helper'

describe 'Movies', type: :request do
  describe 'GET /movies' do
    let!(:movies) { create_list(:movie, 20) }
    let(:json_response) { JSON.parse(response.body) }
    let(:params) { {} }

    before { get '/movies', params: params }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns movies' do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(20)
      expect(json_response.map { |x| x['id'] }).to match_array(Movie.all.pluck(:id))
    end

    context 'with pagination' do
      let(:params) { { page: '1', per_page: '5' } }
      it 'returns paginated result' do
        expect(json_response).not_to be_empty
        expect(json_response.size).to eq(5)
      end
    end
  end
end
