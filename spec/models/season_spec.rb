# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/purchasable_spec'

describe Season, type: :model do
  it_behaves_like 'purchasable'

  it { is_expected.to have_many(:episodes) }
end
