class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @my_articles = @user.posts.order('created_at DESC').includes([:likes, :comments, :views])
        
        # Array
        liked_articles_ar = @user.likes.order('created_at DESC').includes(:post).map{|like| like.post}
        @liked_articles = Kaminari.paginate_array(liked_articles_ar).page(params[:page]).per(10)
        
        commented_articles_ar = @user.comments.order('created_at DESC').includes(:post).map{|comment| comment.post}
        @commented_articles = Kaminari.paginate_array(commented_articles_ar).page(params[:page]).per(10)
    
        # Popular articles
        @my_articles_best = popular_articles(@my_articles)
        
        # Portfolio
        @my_articles_portfolio = portfolio?(@user, @my_articles)
        @r_color_range = [*0..255]
        @g_color_range = [*0..255]
        @b_color_range = [*0..255]
        
    end
    
    def update
        binding.pry
        user = User.find_by(params[:id])
        user.update(update_params)
        redirect_back(fallback_location: root_path)
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname, :email, :bio, :language, :image)
        
    end
    
    def popular_articles(posts)
        my_articles_like = @my_articles.map{
            |post| [post.id, post.likes.count]
        }.to_h
        
        result = Hash[my_articles_like.sort_by{|_, v| -v}].keys.slice(0..5).map{
            |post_id| @my_articles.find_by(id: post_id)
        }
        
        return result
    end
    
    def portfolio?(user, my_articles)
        
        my_articles_count_all = my_articles.count
        my_articles_perCurrency_count = user.posts.group(:currency_pair).count
    
        result = my_articles_perCurrency_count.map{|k, v|
            [k, v*100.to_f/my_articles_count_all.to_f.to_i]
        }.to_h

        result_sort = Hash[result.sort_by{|_, v| -v}]
        
        return result_sort
        
    end
end
