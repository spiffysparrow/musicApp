class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :create_auth_input

  def current_user
    return false if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    session[:session_token] = nil
  end

  def create_auth_input
    input_tag = (<<-HTML)
      <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
    HTML
  end
end
