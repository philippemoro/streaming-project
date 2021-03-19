# frozen_string_literal: true

# == Schema Information
#
# Table name: purchase_options
#
#  id         :uuid             not null, primary key
#  price      :decimal(, )
#  quality    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content_id :uuid
#
# Indexes
#
#  index_purchase_options_on_content_id  (content_id)
#
class PurchaseOptionSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :price, :quality, :created_at, :updated_at, :content_id

  # relations
  belongs_to :content
end
