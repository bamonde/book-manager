class BooksController < ApplicationController
  before_action :dependencies, only: %i[new create edit update]
  before_action :load_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if (@book.save)
      flash[:success] = 'Livro criado com sucesso!'
      redirect_to books_path
    else
      flash[:error] = 'Erros encontrados nos campos!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if (@book.update(book_params))
      flash[:success] = 'Dados do livro atualizado com sucesso!'
      redirect_to books_path
    else
      flash[:error] = 'Erros encontrados nos campos!'
      render :new
    end
  end

  def destroy
    @book.destroy

    flash[:success] = 'Livro excluído!'

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :release_date, :edition, :isbn, :iccn, :oclc, :publisher_id, author_ids: [] )
  end

  def dependencies
    @authors = Author.all
    @publishers = Publisher.all
  end

  def load_book
    @book = Book.find(params[:id])
  rescue
    flash[:error] = 'Livro não encontrado!'
    redirect_to books_path
  end
end
