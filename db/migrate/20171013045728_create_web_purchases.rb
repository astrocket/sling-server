class CreateWebPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :web_purchases do |t|
      t.references :web_product, index: true
      t.references :user, index: true

      t.string :imp_uid
      t.string :pg_provider
      t.boolean :permission, default: false
      t.boolean :validation, default: false
      t.integer :amount
      t.string :name
      t.string :status
      t.string :receipt_url
      t.string :pay_method
      t.string :merchant_uid
      t.string :verification_key

      t.timestamps
    end
  end
end
