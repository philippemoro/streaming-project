# frozen_string_literal: true

class UsersController < ApplicationController
  def library
    @user = User.find(params[:id])
    fetch_library

    json_response(@library)
  end

  def fetch_library
    Rails.cache.fetch("#{@user.cache_key_with_version}/library", expires_in: 15.minutes) do
      @library = @user.alive_purchases.all.order(:expires_at)
    end
  end
end
