# frozen_string_literal: true

module JsonException
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ message: error.message }, [], :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, [], :not_found)
    end
  end
end
