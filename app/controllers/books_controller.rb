class BooksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :action => 'index'
    else
      flash.now[:alert] = @book.errors.full_messages.first
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    unauthorized! if cannot? :edit, @book
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      flash[:notice] = 'Success'
      redirect_to book_path(@book)
    else
      flash.now[:alert] = @book.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to :action => 'index'
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :paypal_form_html, :jump_link, :photo)
  end
end
