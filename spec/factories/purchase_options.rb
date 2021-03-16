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
FactoryBot.define do
  factory :purchase_option do
    content
    price { [9.99, 15.99, 29.99].sample }
    quality { %w[SD HD].sample }
  end
end
