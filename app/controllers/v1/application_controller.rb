class V1::ApplicationController < ApplicationController
  rescue_from CarService::ArgumentError, with: :respond_with_service_error

  private
    def respond_with_service_error(e)
      render json: { message: e.message }, status: :unprocessable_entity
    end
end
