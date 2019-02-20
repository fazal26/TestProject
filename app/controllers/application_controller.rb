class ApplicationController < ActionController::Base
    include Pundit
    include ApplicationHelper
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if current_user.has_role?(:super)
            super_panel_index_path
        elsif isAdmin
            admin_panel_index_path
        elsif isUser
            root_path
        end
    end
end
