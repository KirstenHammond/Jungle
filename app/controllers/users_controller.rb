class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #add password_digest to params if params.password===password_confirmation
    
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/products'
   else
    flash[:alert] = "Unable to register user"
    redirect_to '/users/new'
   end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
