class UsersController < ApplicationController

  before_action :authenticated!, :set_user, :authorized!, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end



private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

## Moved to the SessionsHelper
  # def logged_in?
  #   session[:user_id].present?
  # end

  # def authenticated!
  #   unless logged_in?
  #     redirect_to new_session_path
  #   end
  # end

  def set_user
    @user = User.find(params[:id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end
end