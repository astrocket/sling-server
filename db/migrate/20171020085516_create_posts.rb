class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.integer :comments_count

      t.timestamps
    end
  end
end
