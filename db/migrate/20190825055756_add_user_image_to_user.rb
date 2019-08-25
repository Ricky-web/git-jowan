class AddUserImageToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_image, :string, after: :nickname, default: "default.png"
  end
end
