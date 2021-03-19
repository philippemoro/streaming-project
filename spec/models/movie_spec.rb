# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'
require 'models/concerns/purchasable_spec'

describe Movie, type: :model do
  it_behaves_like 'purchasable'
end
