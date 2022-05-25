class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  def after_sign_in_path_for(resource)
    homes_path
  end

  def after_sign_out_path_for(resource)
    welcomes_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :school_category_id, :subject_id, :grade_id, :club_id, :duty_id, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :school_category_id, :subject_id, :grade_id, :club_id, :duty_id, :avatar])
  end

end