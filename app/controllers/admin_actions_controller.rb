class AdminActionsController < ApplicationController
    before_action :authenticate_admin! ,unless: :user_signed_in?
    
    def dashboard
        @users = User.all
    end

    def user_list

    end

end
