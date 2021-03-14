# frozen_string_literal: true

require 'rails_helper'

describe Episode, type: :model do
  it { should belong_to(:season) }
end
