class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Authenticable
  helper_method :current_user

    protected

    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

    # def authenticate
    #   return false if current_user
    #   redirect_to login_path, alert: "You need to log in or sign up"
    # end
  # protect_from_forgery with: :exception
  # before_action :add_allow_credentials_headers

  # private

  # def add_allow_credentials_headers
  #   response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
  #   response.headers['Access-Control-Allow-Credentials'] = 'true'
  # end
end
