class AddColumnToUsers < ActiveRecord::Migration[6.0]
  
  def up
    add_column :users, :language, :string, default: "EN", after: :bio
  end
  
  def down
    remove_column :users, :language, :string
  end
  
end
