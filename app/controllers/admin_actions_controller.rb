class AdminActionsController < ApplicationController
    layout 'adminLayout'
    before_action :authenticate_admin! ,unless: :user_signed_in? and :Meeting_place_signed_in?
    
    # العرض
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

    def change_user_type_requests
        @CUTR = ChangeUserTypeRequest.joins(:user).select('users.* , change_user_type_requests.*')
    end
    #------------------------

    #معالجة طلبات تغيير نوع الحساب 
    def change_user_type
        @Request = ChangeUserTypeRequest.find(params[:id])
        @user = User.find(@Request.user_id)
        @user.update(role: 2)
        @Request.destroy
    end
    def reject_user_request
        @Request = ChangeUserTypeRequest.find(params[:id])
        @user = User.find(@Request.user_id)
        
        ProfileActionMailer.SendChangeUserRequestRejectReason(@user, params[:reject_reason]).deliver_now
        @Request.destroy
    end
    #------------------------


    # معالجة طلبات إنشاء الملتقى
    def create_meeting_place_profile
        random_password = SecureRandom.hex(12 / 2)
        @Meeting_place_request = CreatingMeetingPlaceRequest.find(params[:id])
        @Profile = MeetingPlace.new()
        @Profile.email = @Meeting_place_request.email
        @Profile.store_name = @Meeting_place_request.stor_name
        @Profile.owner_name = @Meeting_place_request.owner_name
        @Profile.governate = @Meeting_place_request.governate
        @Profile.city_name = @Meeting_place_request.city_name
        @Profile.location_details = @Meeting_place_request.location_details
        @Profile.password = random_password
        @Profile.save!()
        @Meeting_place_request.delete
        ProfileActionMailer.SendMeetingPlaceData(@Profile).deliver_now
        puts @Profile.owner_name
        redirect_to admin_MPR_path, notice: "تم إرسال البريد ببيانات الحساب :)"
    end

    def reject_meeting_request
    end
    #--------------------------
    

    # إدارة حسابات المستخدمين
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
    #---------------------
end
