class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.integer :client_id
      t.string :location
      t.string :title
      t.string :description
      t.string :budget
      t.string :time_commitment
      t.integer :genre_id
      t.string :sample_images

      t.timestamps

    end
  end
end
