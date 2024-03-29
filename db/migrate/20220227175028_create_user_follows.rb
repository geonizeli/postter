class CreateUserFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :user_follows do |t|
      t.references :follower, references: :users, foreign_key: { to_table: :users }
      t.references :followed, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
