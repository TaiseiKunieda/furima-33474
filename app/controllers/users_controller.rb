class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :nickname, :first_name_J, :last_name_J, :first_name_K, :last_name_K, :birthday)
  end
end