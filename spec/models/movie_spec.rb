# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/purchasable_spec'

describe Movie, type: :model do
  it_behaves_like 'purchasable'
end
