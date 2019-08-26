class AddNicknameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, limit: 10, after: :id, null: false
    add_index :users, :nickname, :unique => true
  end
end