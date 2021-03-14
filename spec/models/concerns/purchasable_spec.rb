# frozen_string_literal: true

require 'rails_helper'

shared_examples 'purchasable' do
  it { is_expected.to have_many(:purchase_options) }
end
