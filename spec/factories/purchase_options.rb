# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    content
    price { [9.99, 15.99, 29.99].sample }
    quality { %w[SD HD].sample }
  end
end
