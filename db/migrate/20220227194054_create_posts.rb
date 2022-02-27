class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: true
      t.references :user, null: false, references: :user, foreign_key: { to_table: :users }
      t.references :quoted_post, null: true, references: :post, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
