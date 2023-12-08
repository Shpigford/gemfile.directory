class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to root_path, alert: "Requires authentication" unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!current_user
  end
end
