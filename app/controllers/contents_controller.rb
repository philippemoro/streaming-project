# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    @contents = Content.all.order(:created_at)

    json_response(@contents, :purchasable)
  end
end
