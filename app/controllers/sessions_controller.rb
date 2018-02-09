class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in (user)
      flash.now[:success] = "Heureux de te revoir"
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Champs invalides!'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
