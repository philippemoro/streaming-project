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
require 'rails_helper'

describe Content, type: :model do
  it { should belong_to(:purchasable) }
  it { should have_many(:purchase_options) }
end
