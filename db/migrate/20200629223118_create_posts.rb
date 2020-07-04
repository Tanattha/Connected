class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :category_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
