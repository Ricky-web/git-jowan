class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  [:user_id, :post_id, :text].each do |v|
    validates v, presence: true
  end
end
