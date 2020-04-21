class TrailsController < ApplicationController
    def index
        @trails = Trail.all
        render json: @trails
    end

    def show
        @trail = Trail.find(params[:id])
	    render json: @trail
    end


    def update
        @trail = Trail.find(params[:id])
        @trail.update(condition_status: params[:status], condition_details: params[:details])

        render json: @trail
    end

end
