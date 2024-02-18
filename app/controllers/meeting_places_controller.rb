class MeetingPlacesController < ApplicationController
    before_action :authenticate_meeting_place! ,unless: :user_signed_in? and :admin_signed_in?
    
    def Main
        @disable_nav = true
        @in_location_exchanges = RequestLog.where(meeting_place_id: current_meeting_place.id)
        .where('meeting_time > ?', Time.zone.now - 30.minutes)

    end
end