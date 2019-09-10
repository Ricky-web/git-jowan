class Post < ApplicationRecord
    has_rich_text :content
    has_many :likes
    has_many :views
    has_many :comments
    belongs_to :user
    
    [:title, :currency_pair, :user_id].each do |v|
        validates v, presence: true
    end
    
    def self.create_ranks
        # @ranks = Like.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys.map{|post_id| Post.find(post_id)}
        self.find(Like.group(:post_id).order('count(post_id) DESC').limit(20).pluck(:post_id))
    end
end
