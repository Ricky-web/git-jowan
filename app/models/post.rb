class Post < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    
    [:title, :currency_pair, :user_id].each do |v|
        validates v, presence: true
    end
end
