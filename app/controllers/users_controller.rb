class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
#      sign_in @user
      flash[:success] = "Welcome to the Test Application!"
      redirect_to root_path
    else
      @user.password = ''
      @user.password_confirmation = ''
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to new_session_path
  end
end
