class CreateActivityDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_details do |t|
      t.belongs_to :activity, foreign_key: true
      t.string :name
      t.text :about
      t.string :location
      t.datetime :schedule
      t.attachment :pic

      t.timestamps
    end
  end
end
