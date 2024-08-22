class UsersController < ApplicationController
  def create
    return redirect_to new_user_path if params[:user][:password] != params[:user][:password_confirmation]
    @user = User.new(user_params)
  
    if @user.save
      session[:user_id] = @user.id
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
