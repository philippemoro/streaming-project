# frozen_string_literal: true

require 'rails_helper'

describe Purchase, type: :model do
  it { is_expected.to belong_to(:purchase_option) }
  it { is_expected.to belong_to(:user) }
end
