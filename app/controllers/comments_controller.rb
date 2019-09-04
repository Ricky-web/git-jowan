class CommentsController < ApplicationController
    
    def create
        Comment.create(create_params)
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
    end
    
    private
    def create_params
        params.permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
    end
    
end
