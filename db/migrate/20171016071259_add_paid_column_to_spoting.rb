class AddPaidColumnToSpoting < ActiveRecord::Migration[5.1]
  def change
    add_column :spotings, :paid, :boolean, default: false
  end
end
