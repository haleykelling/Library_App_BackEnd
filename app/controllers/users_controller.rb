class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save 
            render json: @user
        else
            render json: { error: "Username already exists"}
        end
    end

    private 

    def user_params 
        params.permit(:username, :password)
    end
end
