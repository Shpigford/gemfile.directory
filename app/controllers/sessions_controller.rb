class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_path = request.env["omniauth.origin"] || root_path
      redirect_to redirect_path, notice: "Logged in as #{@user.name}"
    else
      redirect_to root_url, alert: "Failure"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

  def failure
    redirect_to root_path, alert: "Failure"
  end
end
