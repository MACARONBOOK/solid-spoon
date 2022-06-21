class UsersController < ApplicationController

  def index
    @users = User.page(params[:page])

    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @user_id = current_user.id
    @books = @user.books.page(params[:page]).per(5)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
