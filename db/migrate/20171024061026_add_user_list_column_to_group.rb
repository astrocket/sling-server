class AddUserListColumnToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :users_list, :longtext
    add_column :spots, :users_list, :longtext
    add_column :activities, :users_list, :longtext
  end
end
