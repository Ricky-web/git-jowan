class ViewsController < ApplicationController
    def create
        @view = View.create(post_id: params[:post_id], user_id: current_user.id)
        redirect_back(fallback_location: root_path)
    end
end
