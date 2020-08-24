class UsersController < ApplicationController

    def create
        @user = User.new user_params 
        if @user.save 
            payload = {user_id: @user.id}
            token = JWT.encode payload, secret
            render json: { 
                token: token, 
                name: @user.first_name
            }
        else
            render json: { error: "Invalid request." }, status: :bad_request
        end
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end
end
