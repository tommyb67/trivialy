class SessionsController < ApplicationController
  def new
    @game = Game.all.order("score DESC")
    @user = User.all
    render :new
  end

  def create
    # authenticate that user/pass combo is legit
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_path(user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    # I will need to define this path
    redirect_to new_session_path
  end
end