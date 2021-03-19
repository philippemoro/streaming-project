# frozen_string_literal: true

require 'rails_helper'

describe 'Contents', type: :request do
  describe 'GET /contents' do
    let!(:movies) { create_list(:movie_content, 5) }
    let!(:seasons) { create_list(:season_content, 5) }
    let(:json_response) { JSON.parse(response.body) }
    let(:params) { {} }

    before { get '/contents', params: params }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all contents' do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
      expect(json_response.map { |x| x['id'] }).to match_array(Content.all.pluck(:id))
    end

    it 'returns nested purchasables' do
      expect(json_response.map { |x| x['purchasable'] }.pluck('id'))
        .to match_array(Season.all.pluck(:id) + Movie.all.pluck(:id))
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
