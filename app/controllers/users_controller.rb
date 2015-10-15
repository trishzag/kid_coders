class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:index]

  def index
    @users = User.all.page params[:page]
  end

  def create
    @user = User.new
  end

  def show
    if current_user == User.find(params[:id]) || current_user.admin?
      @user = current_user
      @curricula = @user.curricula
      @assignments = @user.assignments
    else
      flash[:alert] = 'You do not have permission to access this user page.'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'User deleted successfully.'
    redirect_to users_path
  end

  protected

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email,
    :password, :login, :admin)
  end
end
