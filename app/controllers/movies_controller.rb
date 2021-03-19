# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    json_response(MovieSerializer.new(fetch_movies).serializable_hash.to_json)
  end

  def fetch_movies
    Rails.cache.fetch("movies-#{permitted_params[:page]}-#{permitted_params[:per_page]}", expires_in: 1.minutes) do
      Movie.all.order(:created_at).paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
    end
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
