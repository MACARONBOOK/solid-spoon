class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to books_path
    else
      render :new
    end
  end

  def index
    @books = Book.page(params[:page])
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user_id = current_user
    @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    @book.update(book_params)
    if @book.save
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
