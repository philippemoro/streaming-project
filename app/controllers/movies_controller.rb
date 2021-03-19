# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :fetch_movies, only: [:index]

  def index
    json_response(@movies)
  end

  def fetch_movies
    @movies = Movie.all.order(:created_at)
                   .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
