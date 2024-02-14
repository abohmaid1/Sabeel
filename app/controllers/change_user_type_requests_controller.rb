class ChangeUserTypeRequestsController < ApplicationController
  before_action :set_change_user_type_request, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @change_user_type_requests = ChangeUserTypeRequest.all
  end

  def show
  end

  def new
    @change_user_type_request = ChangeUserTypeRequest.new
  end

  def edit
  end

  def create
    @change_user_type_request = ChangeUserTypeRequest.new(change_user_type_request_params)

    respond_to do |format|
      if @change_user_type_request.save
        format.html { redirect_to root_path, notice: "تم إرسال طلبك بنجاح، سيتم إعلامك في حال الترقية خلال الأيام القادمة" }
        format.json { render :show, status: :created, location: @change_user_type_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @change_user_type_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @change_user_type_request.update(change_user_type_request_params)
        format.html { redirect_to change_user_type_request_url(@change_user_type_request), notice: "Change user type request was successfully updated." }
        format.json { render :show, status: :ok, location: @change_user_type_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @change_user_type_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @change_user_type_request.destroy

    respond_to do |format|
      format.html { redirect_to change_user_type_requests_url, notice: "Change user type request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_change_user_type_request
      @change_user_type_request = ChangeUserTypeRequest.find(params[:id])
    end

    def change_user_type_request_params
      params.require(:change_user_type_request).permit(:user_id, :card)
    end
end
