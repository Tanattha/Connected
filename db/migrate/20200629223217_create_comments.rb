class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false, foreign_key: true
      t.integer :user_id, null: true, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
