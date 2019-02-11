class AdminPanelController < ApplicationController
    before_action :validate_admin
    def index
        @org = Organization.with_role(:admin, current_user).first
    end

    def manage_user
        @users = User.with_role(:user, @org)
    end

    def manage_case; end

    private 
    def validate_admin
        return true if current_user.has_role?(:admin)
    end


end
