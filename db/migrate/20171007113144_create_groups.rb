class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :manager
      t.string :name
      t.string :category
      t.boolean :premium

      t.timestamps
    end
  end
end
