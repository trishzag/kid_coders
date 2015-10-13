class AdminController < ApplicationController
  before_action :authorize_user

  def create
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    flash[:success] = "#{@user.username} is now an admin."
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
    flash[:success] = "#{@user.username} is no longer an admin."
    redirect_to users_path
  end


  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end
end
