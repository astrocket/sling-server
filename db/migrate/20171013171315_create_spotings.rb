class CreateSpotings < ActiveRecord::Migration[5.1]
  def change
    create_table :spotings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :spot, index: true, foreign_key: true

      t.timestamps
    end
  end
end
