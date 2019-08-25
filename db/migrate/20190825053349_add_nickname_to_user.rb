class AddNicknameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, after: :id
  end
end