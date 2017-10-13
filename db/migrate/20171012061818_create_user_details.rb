class CreateUserDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_details do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.datetime :birth
      t.string :phone
      t.string :job
      t.string :company
      t.string :position
      t.string :interested_area
      t.string :interested_field
      t.attachment :pic

      t.timestamps
    end
  end
end
