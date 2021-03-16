# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    @purchase_option = PurchaseOption.find(permitted_params[:purchase_option_id])

    @purchase = Purchase.create!(permitted_params.merge({ price: @purchase_option.price }))

    json_response(@purchase)
  end

  def permitted_params
    @permitted_params ||= begin
      params.require(%i[user_id purchase_option_id])
      params.permit(:user_id, :purchase_option_id)
    end
  end
end