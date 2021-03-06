class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :is_female, :date_of_birth, :profile_picture) }
    end



  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end





end

