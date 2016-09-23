require 'configus'

Configus.build Rails.env do
  env :production do
    eta_cache do
      expires_in 1.minute
      round_precision 4
    end

    eta_calc_car_count 3
    distance_to_eta_coeff 1.5
  end

  env :development, :parent => :production do
  end

  env :test, :parent => :development do
  end
end