class ApplicationController < ActionController::Base
  include ActionController::Cookies

  before_action :authenticate_user!

  def redirect_to_sign_in
    redirect_to new_dashboard_admin_user_session_path
  end
end
