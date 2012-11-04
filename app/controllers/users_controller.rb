# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  helper_method :user, :users
  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def create
    if user.save
      redirect_to users_path, :notice => "User successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user.update_attributes(user_params)
      redirect_to users_path, :notice => "Successfully updated the user."
    else
      render :edit
    end
  end

  def user
    @user ||= params[:id] ? User.find(params[:id]) : User.new(user_params)
  end

  def users
    @users = User.all
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
