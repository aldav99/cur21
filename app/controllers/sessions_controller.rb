class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:original_url] || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def redirect_to_path
    path = {}
    cookies.each do |key, msg|
      path[key.to_sym] = msg
    end
    path
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    cookies.delete :original_url
    redirect_to login_url
  end

end
