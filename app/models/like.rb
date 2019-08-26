class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  [:user_id, :post_id].each do |v|
    validates v, presence: true
  end
end
