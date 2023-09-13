require 'googlebooks' 

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /books or /books.json
  def index
    @books = current_user.books
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json

  def create
    @book = Book.new(book_params)
    @book.user_ids = current_user.id
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: "Book was successfully created." }
        format.json { render :index, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_user
    
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  


  def search
    if params[:title_search].present?
      @google_Books = GoogleBooks.search(params[:title_search])
      @local_Books = Book.filter_by_title(params[:title_search])
    else
      @google_Books = []
      @local_Books = []
    end
    
    respond_to do |format|
    format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_results", 
          partial: "books/search_results", locals: {google_Books: @google_Books, local_Books: @local_Books})
      end
    end 
  end

  def remove_book_from_user
    respond_to do |format|
      if current_user.books.delete(Book.find(params[:id]))
        format.html { redirect_to library_url, notice: "Book removed" }
        format.json { render :library, status: :ok}
      else
        format.html { render :library, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_book_to_user
    @book = set_book
    @check = UserHaveBook.where(user_id: current_user, book_id: @book.id)
    respond_to do |format|
      if @check.blank?
        @book.users << current_user
        format.html { redirect_to library_url, notice: "Book Added" }
      else
        format.html { redirect_to library_url, alert: "Book Already in your library" }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :discription, :cover, user_have_book_attributes: [:user_rate, :availbe_to_trade], user_ids: [])
    end
end
