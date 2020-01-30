class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
       
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end

  private
    def user_params
      params.permit(:firstName, :lastName, :email, :password, :password_confirmation, :idFile)
    end
end
