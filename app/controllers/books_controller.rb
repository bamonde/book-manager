class BooksController < ApplicationController
  before_action :dependencies, only: %i[new create edit update]
  before_action :load_book, only: %i[show edit update destroy]

  def index
    @books = Book.includes(:publisher, :authors).order(updated_at: :desc).all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    return respond_with @book, location: books_path if (@book.save)

    respond_with @book
  end

  def show
  end

  def edit
  end

  def update
    return respond_with @book, location: books_path if (@book.update(book_params))

    respond_with @book
  end

  def destroy
    @book.destroy

    flash[:notice] = t('.notice', scope: 'flash')

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :cover, :genre, :release_date, :edition, :isbn, :iccn, :oclc, :remove_cover, :publisher_id, author_ids: [])
  end

  def dependencies
    @authors = Author.all
    @publishers = Publisher.all
  end

  def load_book
    @book = Book.find(params[:id])
  rescue
    flash[:alert] = t('.not_found', scope: 'flash')
    redirect_to books_path
  end
end
