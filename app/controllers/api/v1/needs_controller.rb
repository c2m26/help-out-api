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

    def index
      needs = Need.all
      render json: needs
    end

    def get_creatorID
      need = Need.find(params[:id])
      user = need.userID
      render json: {creatorID: user}
    end

    def get_userNeeds
      userNeeds = Need.where(userID: params[:id])
    
      render json: {
        data: userNeeds
      }
    end

    def get_openNeeds
      openNeeds = Need.where(status: "open")
    
      render json: openNeeds
    end

    private

    def need_params
            params.require(:need).permit(:userID, :title, :description, :needType, :lat, :lng, :formattedAddress, :status)
    end
end