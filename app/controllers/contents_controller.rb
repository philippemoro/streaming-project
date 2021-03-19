# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :fetch_contents, only: [:index]

  def index
    json_response(ContentSerializer.new(@contents).serializable_hash, :purchasable)
  end

  private

  def fetch_contents
    Rails.cache.fetch('/contents', expires_in: 1.minutes) do
      @contents = Content.all.order(:created_at)
                         .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
    end
  end

  def permitted_params
    params.permit(:page, :per_page)
  end
end
