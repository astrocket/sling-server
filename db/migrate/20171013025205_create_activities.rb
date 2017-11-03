class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.belongs_to :group, foreign_key: true
      t.string :category
      t.boolean :premium
      t.integer :maximum
      t.integer :users_count

      t.timestamps
    end
  end
end
