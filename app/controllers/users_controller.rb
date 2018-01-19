class UsersController < ApplicationController

  # before_filter :authenticate_user!, except => [:show, :index]

  before_action :set_user, only: :show

  def index

    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    debugger
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def set_user
    @user = User.find(current_user)
  end
  private

  def user_params

    params.require(:user).permit(:candidates)
  end
end
