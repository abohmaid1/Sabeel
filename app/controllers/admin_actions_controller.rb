class AdminActionsController < ApplicationController
    before_action :authenticate_admin!
    
    def dashboard
        @users = User.all
    end

    def user_list

    end

end
