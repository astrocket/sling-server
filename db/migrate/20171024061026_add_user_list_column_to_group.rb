class AddUserListColumnToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :users_list, :text
    add_column :spots, :users_list, :text
    add_column :activities, :users_list, :text
  end
end
