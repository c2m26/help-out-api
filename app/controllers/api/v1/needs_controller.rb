class Api::V1::NeedsController < ApplicationController
        
    def create
      need = Need.new(need_params)
      if need.save
        render json: {
          data: need,
          status: :ok
        } 
                  
      else
        render json: {
          errors: need.errors,
          status: :unprocessably_entity
        }
      end
    end

    def update_status
      need = Need.find(params[:id])
      need.status = params[:status]
      need.save
      render json: need
    end

    def get_creatorID
      need = Need.find(params[:id])
      user = need.userID
      render json: user
    end

    def get_userNeeds
      userNeeds = Need.where(userID: params[:id])
    
      render json: userNeeds
    end

    def get_openNeeds
      openNeeds = Need.where(status: "open")
    
      render json: openNeeds
    end

    def get_Need
      need = Need.find(params[:id])
      render json: need
    end

    def index
      needs = Need.all
      render json: needs
    end

    private

    def need_params
            params.require(:need).permit(:userID, :title, :description, :needType, :lat, :lng, :formattedAddress, :status)
    end
end