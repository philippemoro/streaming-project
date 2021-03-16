# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:purchases) }
  it { is_expected.to have_many(:alive_purchases) }
  it { should validate_presence_of(:email) }

  it { should allow_value('email@test.com').for(:email) }
  it { should_not allow_value('cheetos').for(:email) }

  context 'scope' do
    subject(:user) { create(:user) }
    context '.alive_purchases' do
      let!(:expired_purchases) { create_list(:expired_purchase, 5, user: user) }
      let!(:alive_purchases) { create_pair(:purchase, user: user) }

      it 'returns only alive_purchases correctly' do
        expect(user.alive_purchases).to contain_exactly(*alive_purchases)
      end

      it 'returns all purchases when not scoped' do
        expect(user.purchases.count).to eq(7)
      end
    end
  end
end
