class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to chatrooms_path
    else
      redirect_to root_path, flash[:notice] =  user.errors.messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
