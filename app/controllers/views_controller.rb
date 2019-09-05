class ViewsController < ApplicationController
    def create
        @view = View.create(post_id: params[:post_id], user_id: current_user.id)
        redirect_to controller: 'posts', action: 'show', id: params[:post_id]
    end
end
