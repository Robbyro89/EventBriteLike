class UsersController < ApplicationController

  def index
    @users = User.all
    puts @event.inspect
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bienvenue sur EvenBriteLike"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
