# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id               :uuid             not null, primary key
#  purchasable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :uuid
#
# Indexes
#
#  index_contents_on_purchasable_type_and_purchasable_id  (purchasable_type,purchasable_id)
#
class Content < ApplicationRecord
  has_many :purchase_options
  belongs_to :purchasable, polymorphic: true
end
