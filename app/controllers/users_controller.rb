# frozen_string_literal: true

class UsersController < ApplicationController
  def library
    @user = User.find(params[:id])
    @library = @user.alive_purchases.all.order(:expires_at)

    json_response(@library)
  end
end
