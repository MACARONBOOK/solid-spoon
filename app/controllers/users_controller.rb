class UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @user = current_user.id
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user.id)
  end

  def destroy

  end

end
