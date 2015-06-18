class UsersController < ApplicationController

  before_filter :set_user, :only => [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:id] = @user.id
    redirect_to root_path

  end

  def login
    @user = User.new

  end

  def postlogin
     @user = User.authenticate(user_params)

      if @user
        session[:id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path
      end

  end

  def show
    if session[:id].nil?
      redirect_to root_path
    else
      render :show
    end

  end



  def post_params
    params.require(:post).permit(:title, :link)

  end

  private

  def set_user
    @user = User.find(session[:id])

  end

  def user_params
    params.require(:user).permit(:username, :password)

  end

end
