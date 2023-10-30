class MainController < ApplicationController
  def index
    if user_signed_in?
      redirect_to library_path
    elsif admin_signed_in?
      redirect_to admin_dashboard_path
    end
  end

  def abou_us
  end
end
