class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
