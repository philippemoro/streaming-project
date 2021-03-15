# frozen_string_literal: true

require 'rails_helper'

describe PurchaseOption, type: :model do
  it { should belong_to(:content) }
end
