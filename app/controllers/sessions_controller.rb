class SessionsController < ApplicationController
#    skip_before_filter :authenticate, :only => [:new, :create]  

  def new
  end
  
  def create
     user = User.authenticate(params[:name], 
                              params[:password])
     if user
       sign_in user
       redirect_to root_path
     else
       flash.now[:error] = "Invalid name/password combination."
       render 'new'
     end
   end

end
