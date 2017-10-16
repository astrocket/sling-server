class AddGenderColumnToUserDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :user_details, :gender, :string
  end
end
