class AddSpotsCountColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spots_count, :integer
  end
end
