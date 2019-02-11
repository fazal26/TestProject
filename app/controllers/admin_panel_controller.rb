class AdminPanelController < ApplicationController
    before_action :validate_admin
    before_action :get_organization, only:[:index, :manage_user, :manage_case]
    
    def index; end

    def manage_user
        @user = User.new
        @users = User.with_role(:user, @org)
    end

    def manage_case
        @cases = Case.where({organization_id: @org.id})
    end


    private 
    def validate_admin
        return true if current_user.has_role?(:admin)
    end
    
    def get_organization
        @org = Organization.with_role(:admin, current_user).first
    end

end
