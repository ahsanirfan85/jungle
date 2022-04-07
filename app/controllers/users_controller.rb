class UsersController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_users_path
    end
  end

  private

  # Can add a .permit() as well and put those field in it that are good to have but not required
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
