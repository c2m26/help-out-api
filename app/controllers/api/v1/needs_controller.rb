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

    private

    def need_params
            params.require(:need).permit(:userID, :title, :description, :needType, :lat, :lng, :formattedAddress, :status)
    end
end