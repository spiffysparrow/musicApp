class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require('user').permit(:email, :password)
  end

end
