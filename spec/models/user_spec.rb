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
  it { should validate_presence_of(:email) }

  it { should allow_value('email@test.com').for(:email) }
  it { should_not allow_value('cheetos').for(:email) }
end
