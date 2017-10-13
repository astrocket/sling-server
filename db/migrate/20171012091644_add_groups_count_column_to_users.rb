class AddGroupsCountColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :groups_count, :integer
  end
end
