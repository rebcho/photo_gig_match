class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :photographer_id
      t.integer :client_id
      t.integer :rating
      t.string :comment

      t.timestamps

    end
  end
end
