class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      params_to_cookies
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end

  end

  def params_to_cookies
    params.each {|key,value| cookies[key.to_s] = value} 
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
