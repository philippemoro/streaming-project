# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :fetch_user, :fetch_library, only: [:library]
  before_action :fetch_library, only: [:library]

  def library
    json_response(@library)
  end

  private

  def fetch_library
    Rails.cache.fetch("#{@user.cache_key_with_version}/library", expires_in: 15.minutes) do
      @library = @user.alive_purchases.all.order(:expires_at)
                      .paginate(page: permitted_params[:page], per_page: permitted_params[:per_page])
    end
  end

  def fetch_user
    @user = User.find(permitted_params[:id])
  end

  def permitted_params
    params.permit(:id, :page, :per_page)
  end
end
