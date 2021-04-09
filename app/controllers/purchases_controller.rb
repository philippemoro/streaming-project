# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :fetch_purchase_option, :fetch_coupon, only: [:create]

  def create
    ActiveRecord::Base.transaction do
      @purchase = Purchase.create!(purchase_params)
      set_coupon
    end

    json_response(PurchaseSerializer.new(@purchase).serializable_hash.to_json)
  end

  private

  def permitted_params
    @permitted_params ||= begin
      params.require(%i[user_id purchase_option_id])
      params.permit(:user_id, :purchase_option_id, :coupon_code)
    end
  end

  def set_price
    @price = @coupon ? 0.0 : @purchase_option.price
  end

  def purchase_params
    permitted_params.slice(:user_id, :purchase_option_id).merge({ price: set_price, coupon: @coupon })
  end

  def fetch_purchase_option
    @purchase_option = PurchaseOption.find(permitted_params[:purchase_option_id])
  end

  def fetch_coupon
    @coupon = Coupon.find_by!(code: permitted_params[:coupon_code]) if permitted_params[:coupon_code]
  end

  def set_coupon
    return unless @coupon && @coupon&.active?

    @price = 0.0
    @coupon.update!(redeemed_at: Time.zone.now, user_id: permitted_params[:user_id])
  end
end
