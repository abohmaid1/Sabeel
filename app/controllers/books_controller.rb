require 'googlebooks'
require 'open-uri'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit destroy ]
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

  def search
    @ResaultFlag = true
    if params[:title_search].present?
      @enterd_word = params[:title_search]
      replacements = {' ' => '+'}
      @books = Book.filter_by_title(params[:title_search])
      @searched_word = (params[:title_search].strip).gsub(Regexp.union(replacements.keys), replacements)  
      if @books.blank?
        @google_books_fetsh = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=intitle:" + @searched_word + "&key=AIzaSyDS_TensPgC0wiMxZSkbBgeasefizc9H60")
        @google_book_fetsh.blank?
          @google_books_fetsh = JSON.parse(@google_books_fetsh)["items"]
          @google_books = Array.new
          if @google_books_fetsh.present?
            for @book in @google_books_fetsh do
              @google_books.push(@book["volumeInfo"])
            end
          else
            @ResaultFlag = false
            google_books = []
          end
          @books = []
        end
      else
        @books = []
        @google_books = []  
      end
      
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("search_results", 
          partial: "books/search_results", locals: {books: @books,ResaultFlag: @ResaultFlag, google_books: @google_books})
        end
      end 
    end
    

    def remove_book_from_user
      respond_to do |format|
        if current_user.books.delete(Book.find(params[:id]))
        format.html { redirect_to library_url, alert: "تم إزالة الكتاب بنجاح" }
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
        format.html { redirect_to library_url, notice: "تم إضافة الكتاب بنجاح" }
      else
        format.html { redirect_to library_url, alert: "تم إضافة الكتاب إلى مكتبتك مسبقاً" }
      end
    end
  end
  
  def add_book_to_database
    @book = Book.new
    @book.title = params[:title]
    @book.discription = params[:description]
    @book.google_book_picture_tag = params[:cover_tag]
    
    respond_to do |format|
      if @book.save!
        @book.users << current_user
        format.html { redirect_to library_url, notice: "تم إضافة الكتاب بنجاح"}
      else
        format.html { redirect_to library_url, alert: "تم إضافة الكتاب إلى مكتبتك مسبقاً" }
      end
    end
  end
  
  
  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :discription, user_have_book_attributes: [:user_rate, :availbe_to_trade], user_ids: [])
    end
end
