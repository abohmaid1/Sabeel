class PresenceController < ApplicationController
  def updateFirstSide
    @FirstSide = RequestLog.find(params[:id])
    @FirstSide.update(first_side_presence: params[:isChecked])
    head :ok
  end
  def updateSecondSide
    @SecondSide = RequestLog.find(params[:id])
    @SecondSide.update(second_side_presence: params[:isChecked])
    head :ok
  end
end
