class Post < ApplicationRecord
    has_rich_text :content
    has_many :likes
    has_many :views
    has_many :comments
    belongs_to :user
    
    [:title, :currency_pair, :user_id].each do |v|
        validates v, presence: true
    end
end
