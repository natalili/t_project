class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:name],
                             params[:password])
    if user.nil?
        flash.now[:error] = "Invalid name/password combination."
        render 'new'
    else
      sign_in user
      redirect_to root_url
    end
  end

end
