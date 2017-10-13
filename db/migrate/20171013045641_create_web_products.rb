class CreateWebProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :web_products do |t|
      t.references :group, index: true
      t.string :name
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
