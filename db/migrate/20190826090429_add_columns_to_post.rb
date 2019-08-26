class AddColumnsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer, null: false, after: :id, index: true
    add_column :posts, :currency_pair, :string, null: false, limit: 6, after: :user_id
    change_column :posts, :title, :string, null: false
  end
end
