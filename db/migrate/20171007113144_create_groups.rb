class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :manager
      t.string :category
      t.boolean :premium
      t.integer :maximum
      t.integer :users_count

      t.timestamps
    end
  end
end
