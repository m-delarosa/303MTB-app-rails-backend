class UserTrailsController < ApplicationController
    def index
        @user_trails = UserTrail.all
        render json: @user_trails
    end

    def create
        @new_user_trail = UserTrail.create(
            user_id: params[:user],
            trail_id: params[:trail]
        )

        render json: @new_user_trail
        # render json: {message: "Trail added to your favorites!", @new_user_trail }
        #redirect_to "http://localhost:3001/showUser.html?id=#{user_id}"
    end

    def destroy
        @user_trail = UserTrail.find(params[:id])
        @user_trail.destroy
        render json: {message: "Trail deleted from favorites."} 
    end
end
