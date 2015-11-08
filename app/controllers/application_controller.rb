class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    path = resource.is_nurse? && !resource.completed? ? profile_dashboard_index_path : dashboard_index_path
    request.env['omniauth.origin'] || stored_location_for(resource) || path
  end

  protected

    def configure_permitted_parameters
      assign_user_type
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(
          :email,
          :password,
          :password_confirmation,
          :type,
          :first_name,
          :last_name,
          :phone
        )
      end
    end

    def assign_user_type
      if params[:user] && params[:user][:type].blank?
        params[:user][:type] = session[:registration]
      end
    end
end
