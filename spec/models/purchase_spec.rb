# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id                 :uuid             not null, primary key
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
require 'rails_helper'

describe Purchase, type: :model do
  it { is_expected.to belong_to(:purchase_option) }
  it { is_expected.to belong_to(:user) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
end
