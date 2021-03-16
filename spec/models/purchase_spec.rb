# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id                 :uuid             not null, primary key
#  expires_at         :datetime
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

  describe 'callbacks' do
    subject(:purchase) { create(:purchase, created_at: '01/01/2021'.to_date) }

    describe '#set_expire_date' do
      it { expect(purchase.expires_at).to eq('03/01/2021'.to_date) }
    end
  end

  describe 'scope' do
    context 'when scoping by alive purchases' do
      let!(:expired_purchases) { create_pair(:expired_purchase) }
      let!(:alive_purchases) { create_pair(:purchase) }

      it 'filters out expired purchases correctly' do
        expect(described_class.alive).to contain_exactly(*alive_purchases)
      end
    end
  end
end
