class AdminActionsController < ApplicationController
    layout 'adminLayout'
    before_action :authenticate_admin! ,unless: :user_signed_in?
    
    def dashboard
        @user_count = User.count
        @books_count = Book.count
    end
    
    def user_list
        @users = User.all.sort
    end

    def meeting_place_request_list
        @MPR = CreatingMeetingPlaceRequest.all
    end

    def ban_user
        user = User.find(params[:id])
        user.lock_access!
        redirect_to admin_user_list_path, notice: "تم أيقاف حساب المستخدم لمدة ثلاثة أيام"
    end

    def unban_user
        user = User.find(params[:id])
        user.unlock_access!
        redirect_to admin_user_list_path, notice: "تم تفعيل الحساب"
    end
end
