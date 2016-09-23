class CarService
  class ServiceError < BaseServiceError; end
  class ArgumentError < ServiceError; end

  attr_reader :lat, :lon

  def initialize(params = {})
    @lat = is_float_valid!('Lattitude', params[:lat])
    @lon = is_float_valid!('Longitude', params[:lon])
  end

  def eta
    distance_array = Car.available.with_distance(lon, lat).limit(configus.eta_calc_car_count).map(&:distance)
    (distance_array.reduce(:+) / distance_array.size.to_f) * configus.distance_to_eta_coeff
  end

  def eta_with_cache
    key = [normalize(lon),normalize(lat)].join
    Rails.cache.fetch(key, expires_in: configus.eta_cache.expires_in){ eta }
  end

  def normalize(float)
    float.to_f.round(configus.eta_cache.round_precision)
  end

  def is_float_valid!(kind, value)
    raise(ArgumentError.new("#{kind} not provided")) if value.nil?
    Float(value) rescue raise(ArgumentError.new("#{kind} is not float"))
  end
end