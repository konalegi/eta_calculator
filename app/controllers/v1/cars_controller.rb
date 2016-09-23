class V1::CarsController < V1::ApplicationController

  def eta
    service = CarService.new(params)
    render json: { eta: service.eta_with_cache }
  end

end