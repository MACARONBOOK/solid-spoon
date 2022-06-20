class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
end
