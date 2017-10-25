class AddManagerInfoColumnToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :manager_info, :text
    add_column :spots, :organizer_info, :text
  end
end
