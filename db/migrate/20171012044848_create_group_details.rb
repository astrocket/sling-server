class CreateGroupDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :group_details do |t|
      t.belongs_to :group, foreign_key: true
      t.string :name
      t.text :about
      t.string :location
      t.attachment :pic

      t.timestamps
    end
  end
end
