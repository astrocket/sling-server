class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authentication_token, :string, limit: 30
    add_index :users, :authentication_token, unique: true
    add_column :users, :key, :string
    add_index :users, :key, :type => :fulltext
  end
end
