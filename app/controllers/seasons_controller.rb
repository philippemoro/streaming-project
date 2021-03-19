# frozen_string_literal: true

class SeasonsController < ApplicationController
  before_action :fetch_seasons, only: [:index]

  def index
    json_response(SeasonSerializer.new(@seasons).serializable_hash.to_json, [:episodes])
  end

  private

  def fetch_seasons
    @seasons = Season.all.order(:created_at)
                     .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
