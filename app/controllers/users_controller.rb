class UsersController < ApplicationController
    before_action :authenticate, only: [:index, :show, :update, :destroy]
    
    def index
        @users = User.all
        render json: @users, include: [:user_trails]
    end
        
    def show
        @user = User.find(params[:id])
        render json: @user
    end
        
    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.registration_confirmation(@user).deliver
            render json: {message: "Please confirm your email address to continue"}
            # redirect_to root_url
            # Not sure if I need this redirect the way I have things set up.
        else
        render json: @user.errors.messages
        end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Welcome to 303MTB! Your email has been confirmed.
            Please sign in to continue."
            # redirect_to signin_url
        else
            flash[:error] = "Sorry. User does not exist"
            redirect_to root_url
        end
    end
        
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        render json: @user
        else
        render json: @user.errors.messages
        end
    end
        
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "User account sucessfully deleted"} 
    end
        
    private
    
    def user_params
        params.require(:user).permit([:name, :username, :email, :password])
    end
end
