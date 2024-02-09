class BookRequestsController < ApplicationController
  before_action :set_book_request, only: %i[ show edit update destroy ]

  def index
    @book_requests = BookRequest.select(
      [
        BookRequest.arel_table[Arel.star], Book.arel_table[:title], Book.arel_table[:google_book_picture_tag], MeetingPlace.arel_table[:store_name], MeetingPlace.arel_table[:city_name], MeetingPlace.arel_table[:location_details],  SupportedGovernate.arel_table[:name].as('governate')
      ]
    ).where(BookRequest.arel_table[:requester_id_id].eq(current_user.id)).joins(
      BookRequest.arel_table.join(UserHaveBook.arel_table).on(
        BookRequest.arel_table[:requested_book_id_id].eq(UserHaveBook.arel_table[:id])
      ).join_sources
    ).joins(
      BookRequest.arel_table.join(Book.arel_table).on(
        UserHaveBook.arel_table[:book_id].eq(Book.arel_table[:id])
      ).join_sources
    ).joins(
      BookRequest.arel_table.join(MeetingPlace.arel_table).on(
        BookRequest.arel_table[:meeting_place_id_id].eq(MeetingPlace.arel_table[:id])
      ).join_sources
    ).joins(
      BookRequest.arel_table.join(SupportedGovernate.arel_table).on(
        MeetingPlace.arel_table[:governate].eq(SupportedGovernate.arel_table[:id])
      ).join_sources
    )
    
  end

  def arrived_book_request
    puts params[:book]
    # @book = Book.find(params[:requestbook_id])
    @book = Book.find(params[:book])
    # @requested_book_request = BookRequest.where(requested_book_id_id: params[:user_have_book_id])
    # .joins(BookRequest.arel_table)


    @requested_book_request = BookRequest.select(
      [
        BookRequest.arel_table[Arel.star], MeetingPlace.arel_table[:store_name], MeetingPlace.arel_table[:city_name], MeetingPlace.arel_table[:location_details],  SupportedGovernate.arel_table[:name].as('governate')
      ]
    ).where(requested_book_id_id: params[:user_have_book_id]).joins(
      BookRequest.arel_table.join(UserHaveBook.arel_table).on(
        BookRequest.arel_table[:requested_book_id_id].eq(UserHaveBook.arel_table[:id])
      ).join_sources
    ).joins(
      BookRequest.arel_table.join(MeetingPlace.arel_table).on(
        BookRequest.arel_table[:meeting_place_id_id].eq(MeetingPlace.arel_table[:id])
      ).join_sources
    ).joins(
      BookRequest.arel_table.join(SupportedGovernate.arel_table).on(
        MeetingPlace.arel_table[:governate].eq(SupportedGovernate.arel_table[:id])
      ).join_sources
    )
    
  end

  def show

  end

  def new
    if @book_request
      puts @book_request.errors
    end
    @owner_book = UserHaveBook.find(params[:book])
    @book = Book.find(@owner_book.book_id)
    @book_request = BookRequest.new
  end
  
  def edit
  end

  def accept_meeting
  end
  
  def reject_meeting
    @book_request = BookRequest.find(params[:book_request_id])
    respond_to do |format|
      if @book_request.update(state: 3)
        format.html { redirect_to root_path, alert: "تم رفض الطلب" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    
    @book_request = BookRequest.new(book_request_params)
    @book_request.requester_id_id = current_user.id
    respond_to do |format|
      if @book_request.save
        format.html { redirect_to library_path, notice: "تم إرسال طلبك بنجاح" }
        format.json { render :show, status: :created, location: @book_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_requests/1 or /book_requests/1.json
  def update
    respond_to do |format|
      if @book_request.update(book_request_params)
        format.html { redirect_to book_request_url(@book_request), notice: "Book request was successfully updated." }
        format.json { render :show, status: :ok, location: @book_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_requests/1 or /book_requests/1.json
  def destroy
    @book_request.destroy

    respond_to do |format|
      format.html { redirect_to book_requests_url, notice: "تم إلغاء طلبك" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_request_params
      params.require(:book_request).permit(:requester_id_id ,:requested_book_id_id, :meeting_place_id_id, :meeting_time)
    end
end
