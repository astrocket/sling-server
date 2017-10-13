class AddActivityCountColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activities_count, :integer
  end
end
