class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :location_id
      t.string :name

      t.timestamps

    end
  end
end
