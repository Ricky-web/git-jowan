class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @my_articles = @user.posts.order('created_at DESC').includes([:likes, :comments, :views]).page(params[:page]).per(20)
        
        # Array
        liked_articles_ar = @user.likes.order('created_at DESC').includes(:post).map{|like| like.post}
        @liked_articles = Kaminari.paginate_array(liked_articles_ar).page(params[:page]).per(20)
        
        commented_articles_ar = @user.comments.order('created_at DESC').includes(:post).map{|comment| comment.post}
        @commented_articles = Kaminari.paginate_array(commented_articles_ar).page(params[:page]).per(20)
    end
    
    def update
        user = User.find_by(params[:id])
        user.update(update_params)
        redirect_back(fallback_location: root_path)
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname, :email, :image)
        
    end
end
