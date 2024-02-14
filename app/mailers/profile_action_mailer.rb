class ProfileActionMailer < ApplicationMailer
    def SendMeetingPlaceData(profile)
        @profile = profile
        mail(to: @profile.email, subject: 'إنشاء ملتقى على منصة سبيل')
    end

    def SendChangeUserRequestRejectReason(user, reject_reason)
        @reject_reason = reject_reason
        mail(to: user.email, subject: 'رفض طلب تغيير نوع الحساب إلى كاتب')
    end
end