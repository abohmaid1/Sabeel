class MeetingPlacesController < ApplicationController
    before_action :authenticate_meeting_place! ,unless: :user_signed_in? and :admin_signed_in?
    
    def Main
      
    end
end