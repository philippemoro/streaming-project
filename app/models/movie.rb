# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  include Purchasable
end
