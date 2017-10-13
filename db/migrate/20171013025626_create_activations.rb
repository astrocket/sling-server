class CreateActivations < ActiveRecord::Migration[5.1]
  def change
    create_table :activations do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
