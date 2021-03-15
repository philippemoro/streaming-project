# frozen_string_literal: true

module Response
  def json_response(object, include = [], status = :ok)
    render json: object, status: status, include: include
  end
end
