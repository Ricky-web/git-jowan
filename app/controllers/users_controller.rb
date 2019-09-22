class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update(update_params)
        redirect_back(fallback_location: root_path)
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname)
    end
end
