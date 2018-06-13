class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.locale.to_sym.eql?(I18n.default_locale.to_sym) ? {} : {lang: I18n.locale}
  end


  def after_sign_in_path_for(user)
    flash[:notice] = t('hello_flash', last_name: current_user.last_name, first_name: current_user.first_name)
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
