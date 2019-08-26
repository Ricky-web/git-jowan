class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :tweet_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
