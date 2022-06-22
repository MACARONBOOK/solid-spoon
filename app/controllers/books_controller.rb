class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      @books = Book.page(params[:page])
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.page(params[:page])
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.page(params[:page])
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @user_id = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]= "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
