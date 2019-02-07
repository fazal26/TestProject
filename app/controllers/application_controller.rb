class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if current_user.has_role?(:super)
            super_panel_index_path
        elsif current_user.has_role? :admin, Organization.find_by(admin_id: current_user.id)
            admin_panel_index_path
        elsif current_user.has_role?(:user)
            root_path
        end
    end
end
