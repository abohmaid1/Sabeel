class CreatingMeetingPlaceRequestsController < ApplicationController
  before_action :set_creating_meeting_place_request, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: [:show, :index]

  def index
    @creating_meeting_place_requests = CreatingMeetingPlaceRequest.all
  end

  def show
  end

  def new
    @disable_nav = true
    @creating_meeting_place_request = CreatingMeetingPlaceRequest.new
  end

  def edit
  end

  def create
    @creating_meeting_place_request = CreatingMeetingPlaceRequest.new(creating_meeting_place_request_params)
    
    respond_to do |format|
      if @creating_meeting_place_request.save
        format.html { redirect_to root_path, notice: "تم ارسال طلبك لتتم معالجته، سيتم أشعارك على البريد الالكتروني بحالة الطلب" }
        format.json { render :show, status: :created, location: @creating_meeting_place_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creating_meeting_place_request.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @creating_meeting_place_request.destroy

    respond_to do |format|
      format.html { redirect_to creating_meeting_place_requests_url, notice: "Creating meeting place request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_creating_meeting_place_request
      @creating_meeting_place_request = CreatingMeetingPlaceRequest.find(params[:id])
    end

    def creating_meeting_place_request_params
      params.require(:creating_meeting_place_request).permit(:email, :stor_name, :owner_name, :contract, :city_name, :location_details, :governate)
    end
end
