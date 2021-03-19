# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'
require 'models/concerns/purchasable_spec'

describe Season, type: :model do
  it_behaves_like 'purchasable'

  it { is_expected.to have_many(:episodes).order(:number) }
  it { should validate_presence_of(:number) }
end
