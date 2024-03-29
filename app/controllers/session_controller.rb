class SessionController < ApplicationController
  def new

  end
  def create
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      session[:user_id] = nil
      flash[:notice] = 'Incorrect Login, try again.'
      redirect_to(root_path)
    end
    authenticate
    redirect_to(teams_path)
  end
  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to(root_path)
  end
end

