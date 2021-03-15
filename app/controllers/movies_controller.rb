# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:created_at)

    json_response(@movies)
  end
end
