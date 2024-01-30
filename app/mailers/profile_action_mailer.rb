class ProfileActionMailer < ApplicationMailer
    def SendMeetingPlaceData(profile)
        @profile = profile
        mail(to: @profile.email, subject: 'إنشاء ملتقى على منصة سبيل')
    end
end
