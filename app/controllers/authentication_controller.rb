class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if @user
            if @user.authenticate(params[:password])
                payload = { user_id: @user.id }
                secret = ENV['SECRET_KEY_BASE']
                token = JWT.encode(payload, secret)

                render json: { token: token, message: "Account login was sucessful!", status: :created }
            else
            render json: { message: "Please verify login credentials and try again."}
            end
        else
            render json: { message: "Please verify login credentials and try again."}
        end
    end
end
