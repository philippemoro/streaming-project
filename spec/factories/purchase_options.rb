# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    price { '9.99' }
    quality { 'MyString' }
  end
end
