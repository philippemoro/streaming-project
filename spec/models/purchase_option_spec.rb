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
require 'rails_helper'

describe PurchaseOption, type: :model do
  it { should belong_to(:content) }
  it { should define_enum_for(:quality).with_values(hd: 'hd', sd: 'sd').backed_by_column_of_type(:string) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
end
