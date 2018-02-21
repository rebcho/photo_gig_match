class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :gig_id
      t.integer :photographer_id

      t.timestamps

    end
  end
end
