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
    fulfillments = Fulfillment.all
    render json: fulfillments
    
  end

  def get_foreignKeys
    fulfillment = Fulfillment.find(params[:id])
    helper = fulfillment.helperID
    need = fulfillment.needID
    render json: {
      helperID: helper,
      needID: need
    }
      
  end

  private

  def fulfillment_params
          params.permit(:needID, :helperID)
  end

end
