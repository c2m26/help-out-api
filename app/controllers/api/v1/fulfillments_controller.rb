class Api::V1::FulfillmentsController < ApplicationController

  def create
    fulfillment = Fulfillment.new(fulfillment_params)
    if fulfillment.save
      render json: {
        data: fulfillment,
        status: :ok
      } 
                
    else
      render json: {
        errors: fulfillment.errors,
        status: :unprocessably_entity
      }
    end
  end

  def index
    fulfillment = Fulfillment.all
    render json: fulfillments
    
  end

  private

  def fulfillment_params
          params.require(:fulfillment).permit(:needID, :helperID)
  end

end
