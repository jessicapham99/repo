class SessionsController < ApplicationController
  before_action :configure_sign_in_params, only: [:create]

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user #see sessions helper
      remember user #see sessions helper
      redirect_to '/main'
    else
      redirect_to '/login'
    end
  end

  def destroy
    #session[:user_id] = nil
    forget(current_user)
    session.delete(:user_id)
    current_user = nil
    redirect_to '/'
  end
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
