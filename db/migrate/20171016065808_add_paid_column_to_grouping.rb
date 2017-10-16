class AddPaidColumnToGrouping < ActiveRecord::Migration[5.1]
  def change
    add_column :groupings, :paid, :boolean, default: false
  end
end
