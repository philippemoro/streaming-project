# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    json_response(ContentSerializer.new(fetch_contents).serializable_hash, :purchasable)
  end

  private

  def fetch_contents
    Rails.cache.fetch("contents-#{permitted_params[:page]}-#{permitted_params[:per_page]}", expires_in: 1.minutes) do
      Content.all.order(:created_at)
             .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
    end
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
