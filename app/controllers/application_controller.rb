class ApplicationController < ActionController::Base
    include Pundit
    include ApplicationHelper
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if current_user.has_role?(:super)
            super_panel_index_path
        # elsif current_user.has_role? :admin, Organization.with_role(:admin, current_user).first
        elsif isAdmin
            admin_panel_index_path
        elsif current_user.has_role?(:user)
            root_path
        end
    end
end
