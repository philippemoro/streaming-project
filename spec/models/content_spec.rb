# frozen_string_literal: true

require 'rails_helper'

describe Content, type: :model do
  it { should belong_to(:purchasable) }
  it { should have_many(:purchase_options) }
end
