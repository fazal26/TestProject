class AdminPanelController < ApplicationController
    before_action :validate_admin
    def index
        @org=  Organization.find(current_user.organization_id)
        
    end

    def manage_user
    end
    def manage_case
    end
    def invite_user
        @newUser = User.new
    end

    private 
    def validate_admin
        return true if current_user.has_role?(:admin)
    end


end
