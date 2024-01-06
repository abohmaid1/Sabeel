class AdminActionsController < ApplicationController
    layout 'adminLayout'
    before_action :authenticate_admin! ,unless: :user_signed_in?
    
    def dashboard
        @user_counts = User.count
    end
    
    def user_list
        @users = User.all
    end

    def meeting_place_request_list
        @requests = CreateMeetingPlaceRequest.all
    end
end
