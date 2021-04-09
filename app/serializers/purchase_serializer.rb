# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id                 :uuid             not null, primary key
#  expires_at         :datetime
#  price              :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :uuid
#  user_id            :uuid
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#
class PurchaseSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :price, :expires_at, :created_at, :updated_at, :user_id, :purchase_option_id

  # relations
  belongs_to :user
  belongs_to :purchase_option
  has_one :coupon
end
