# frozen_string_literal: true

# == Schema Information
#
# Table name: coupons
#
#  id          :uuid             not null, primary key
#  code        :string
#  redeemed_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purchase_id :uuid
#  user_id     :uuid
#
# Indexes
#
#  index_coupons_on_purchase_id  (purchase_id)
#  index_coupons_on_user_id      (user_id)
#
class Coupon < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :purchase, optional: true

  validates :code, presence: true, uniqueness: true

  scope :active, -> { where(redeemed_at: nil) }

  def active?
    redeemed_at.nil?
  end
end
