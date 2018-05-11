class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Account registered!"
      redirect_to admin_path
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end