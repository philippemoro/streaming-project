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
class PurchaseOption < ApplicationRecord
  belongs_to :content
  has_many :purchases

  validates_presence_of :price, :quality
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }

  enum quality: { sd: 'sd', hd: 'hd' }
end
