class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_out_path_for resource
    request.referrer || root_path
  end

  def after_sign_out_path_for resource
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :email, :password,
        :password_confirmation, :phone, :gender, :avatar
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
       user_params.permit :name, :email, :password,
        :password_confirmation, :current_password, :phone, :gender, :avatar
    end
  end

  def authenticate_admin!
    unless current_user.admin?
      flash[:notice] = t "flash.danger.admin"
      redirect_to root_url
    end
  end

  def authenticate!
    redirect_to root_url unless current_user
  end
end
