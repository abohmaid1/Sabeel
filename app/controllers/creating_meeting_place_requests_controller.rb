class CreatingMeetingPlaceRequestsController < ApplicationController
  before_action :set_creating_meeting_place_request, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: [:show, :index]

  # GET /creating_meeting_place_requests or /creating_meeting_place_requests.json
  def index
    @creating_meeting_place_requests = CreatingMeetingPlaceRequest.all
  end

  # GET /creating_meeting_place_requests/1 or /creating_meeting_place_requests/1.json
  def show
  end

  # GET /creating_meeting_place_requests/new
  def new
    @creating_meeting_place_request = CreatingMeetingPlaceRequest.new
  end

  # GET /creating_meeting_place_requests/1/edit
  def edit
  end

  # POST /creating_meeting_place_requests or /creating_meeting_place_requests.json
  def create
    @creating_meeting_place_request = CreatingMeetingPlaceRequest.new(creating_meeting_place_request_params)
    
    respond_to do |format|
      if @creating_meeting_place_request.save
        format.html { redirect_to root_path, notice: "Request has beed sent, we will mail you when accepted, Thank you!" }
        format.json { render :show, status: :created, location: @creating_meeting_place_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creating_meeting_place_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creating_meeting_place_requests/1 or /creating_meeting_place_requests/1.json
  def update
    respond_to do |format|
      if @creating_meeting_place_request.update(creating_meeting_place_request_params)
        format.html { redirect_to creating_meeting_place_request_url(@creating_meeting_place_request), notice: "Creating meeting place request was successfully updated." }
        format.json { render :show, status: :ok, location: @creating_meeting_place_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creating_meeting_place_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creating_meeting_place_requests/1 or /creating_meeting_place_requests/1.json
  def destroy
    @creating_meeting_place_request.destroy

    respond_to do |format|
      format.html { redirect_to creating_meeting_place_requests_url, notice: "Creating meeting place request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creating_meeting_place_request
      @creating_meeting_place_request = CreatingMeetingPlaceRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creating_meeting_place_request_params
      params.require(:creating_meeting_place_request).permit(:email, :stor_name, :owner_name, :contract, :city_name, :location_details, :governate)
    end
end
