class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if @user
            if @user.authenticate(params[:password])
                payload = { user_id: @user.id }
                puts "before secret"
                secret = Rails.application.secrets.secret_key_base
                puts "after secret"
                token = JWT.encode(payload, secret)

                render json: { token: token, message: "Account login was sucessful!", user: @user }
            else
            render json: { message: "Please verify login credentials and try again."}
            end
        else
            render json: { message: "Please verify login credentials and try again."}
        end
    end
end
