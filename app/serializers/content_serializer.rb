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
class ContentSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :title, :plot, :purchasable_type, :created_at, :updated_at, :purchasable_id

  # relations
  has_many :purchase_options
  belongs_to :purchasable, polymorphic: true
end
