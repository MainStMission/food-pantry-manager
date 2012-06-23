class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.create!(params[:user])
      redirect_to users_path, :notice => "User successfully created"
    else
      render :new
    end
  end
end
