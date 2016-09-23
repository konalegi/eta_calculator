module CarRepository
  extend ActiveSupport::Concern

  included do
    scope :available, -> { where(busy: false) }
    scope :with_distance, ->  (longitude, latitude) do
      return if latitude.nil? || longitude.nil?
      select(%{ *, ST_DISTANCE(
        ST_GeographyFromText('SRID=4326;POINT(' || cars.lon || ' ' || cars.lat || ')'),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)')
        ) as distance } % [longitude, latitude])
    end
  end
end


