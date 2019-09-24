class AddBioColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text, after: :email
  end
end
