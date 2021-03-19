# frozen_string_literal: true

class SeasonsController < ApplicationController
  before_action :fetch_seasons, only: [:index]

  def index
    json_response(SeasonSerializer.new(fetch_seasons).serializable_hash.to_json, [:episodes])
  end

  private

  def fetch_seasons
    Rails.cache.fetch("seasons-#{permitted_params[:page]}-#{permitted_params[:per_page]}", expires_in: 1.minutes) do
      Season.all.order(:created_at)
            .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
    end
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
