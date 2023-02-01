class SessionsController < ApplicationController
 
  def create
    
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/products'
    else
      flash[:alert] = "Email and/or password not registered"
      redirect_to '/sessions/new'
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end
