# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.create(user_params)
      redirect_to users_path, :notice => "User successfully created"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "Successfully updated the user."
    else
      render :edit
    end
  end

  private

  def allowable
    [
      :email, :password, :password_confirmation, :remember_me,
      :first_name, :last_name, :password_digest
    ]
  end

  def user_params
    params.require(:user).permit(*allowable)
  end

end
