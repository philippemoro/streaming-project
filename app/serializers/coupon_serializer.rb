# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id               :uuid             not null, primary key
#  plot             :string
#  purchasable_type :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :uuid
#
# Indexes
#
#  index_contents_on_purchasable_type_and_purchasable_id  (purchasable_type,purchasable_id)
#
class CouponSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :code, :redeemed_at, :created_at, :updated_at, :purchase_id, :user_id

  # relations
  belongs_to :purchase
end
