class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.references :organizer
      t.string :category
      t.boolean :premium
      t.integer :users_count

      t.timestamps
    end
  end
end
