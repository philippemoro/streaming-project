# frozen_string_literal: true

class SeasonsController < ApplicationController
  def index
    @seasons = Season.all.order(:created_at)

    json_response(@seasons, [:episodes])
  end
end
