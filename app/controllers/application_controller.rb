class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def public_photos
    Ckeditor::Picture.recent.limit(4)
  end

  def latest_issues
    Issue.all.limit(6)
  end

  helper_method :public_photos, :latest_issues
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name) }
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS|BlackBerry|Opera Mini|Android|palm|SmartPhone|symbian/
    end
  end

  def blackberry_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /BlackBerry/
    end
  end

  helper_method :mobile_device?, :blackberry_device?
end
