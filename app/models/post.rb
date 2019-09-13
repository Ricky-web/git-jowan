class Post < ApplicationRecord
    has_rich_text :content
    has_many :likes, foreign_key: :post_id, dependent: :destroy
    has_many :views, foreign_key: :post_id, dependent: :destroy
    has_many :comments, foreign_key: :post_id, dependent: :destroy
    belongs_to :user
    
    [:title, :currency_pair, :user_id].each do |v|
        validates v, presence: true
    end
    
    def self.create_ranks
    
        start_date = Time.current.beginning_of_day
        end_date = Time.current.end_of_day
        
       daily_posts = Post.where(created_at: start_date..end_date)
       daily_likes = daily_posts.map{|post| [post.id, post.likes.count]}.to_h
       
       daily_post_ranks = Hash[daily_likes.sort_by{|_, v| -v}].keys.slice(0..20)
       result = daily_post_ranks.map{|post_id| Post.find(post_id)}
       
       return result
       
    end
    
    def self.new_post
        now = Time.current
        ten_minutes_ago = now.ago(10.minutes)
        
        if ten_minutes_ago < self.created_at
            true
        else
            false
        end
    end
end
