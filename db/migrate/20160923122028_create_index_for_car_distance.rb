class CreateIndexForCarDistance < ActiveRecord::Migration
  def up
    execute %{
      create index index_on_cars_distance ON cars using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || cars.lon || ' ' || cars.lat || ')'
        )
      )
    }
  end

  def down
    execute %{drop index index_on_cars_distance}
  end
end
