# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :fetch_purchase_option, only: [:create]

  def create
    @purchase = Purchase.create!(permitted_params.merge({ price: @purchase_option.price }))

    json_response(@purchase)
  end

  private

  def permitted_params
    @permitted_params ||= begin
      params.require(%i[user_id purchase_option_id])
      params.permit(:user_id, :purchase_option_id)
    end
  end

  def fetch_purchase_option
    @purchase_option = PurchaseOption.find(permitted_params[:purchase_option_id])
  end
end
