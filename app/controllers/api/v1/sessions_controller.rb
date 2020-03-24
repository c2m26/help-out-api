class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User
          .find_by(email: params["email"])
          .try(:authenticate, params["password"])
    
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  # def create

  #   if user = User.authenticate(params[:email], params[:password])
  #     # Save the user ID in the session so it can be used in
  #     # subsequent requests
  #     session[:current_user_id] = user.id
  #     render json: {
  #       status: :created,
  #       logged_in: true,
  #       user: user
  #     }
  #   end
  # end

  def logged_in
    if @current_user
      render json: {
          logged_in: true,
          user: @current_user
      }
    else
      render json: {
          logged_in: false
      }
    end
  end

  def logout
    # reset_session
    session[:user_id] = nil
    @current_user = nil
    render json: { status: 200, logged_out: true, session: session[:user_id], user: @current_user }
  end
    
end
