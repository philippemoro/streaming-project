# frozen_string_literal: true

# == Schema Information
#
# Table name: coupons
#
#  id          :uuid             not null, primary key
#  code        :string
#  redeemed_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purchase_id :uuid
#  user_id     :uuid
#
# Indexes
#
#  index_coupons_on_purchase_id  (purchase_id)
#  index_coupons_on_user_id      (user_id)
#
require 'rails_helper'

describe Coupon, type: :model do
  it { should belong_to(:purchase).optional }
  it { should belong_to(:user).optional }
  it { should validate_uniqueness_of(:code) }
  it { should validate_presence_of(:code) }

  describe 'scope' do
    context 'when scoping by active coupons' do
      let!(:redeemed_coupons) { create_pair(:redeemed_coupon) }
      let!(:active_coupons) { create_pair(:coupon) }

      it 'filters active coupons correctly' do
        expect(described_class.active).to contain_exactly(*active_coupons)
      end
    end
  end
end
