class ApplicationController < ActionController::API
    def secret
        Rails.application.secret_key_base
    end

    def authenticate
        header = request.headers['Authorization']
        token = header.split(" ").last
        if !token 
            render json: { error: "Must be logged in" }, status: :forbidden
        else
            begin
                payload = JWT.decode(token, secret).first
                @user = User.find(payload['user_id'])
            rescue
                render json: { error: "Must be logged in" }, status: :forbidden 
            end
        end
    end

end
