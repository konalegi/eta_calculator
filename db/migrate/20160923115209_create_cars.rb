class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.float :lat, null: false, default: 0
      t.float :lon, null: false, default: 0
      t.boolean :busy, null: false, default: false

      t.timestamps null: false
    end
  end
end
