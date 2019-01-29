class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if current_user.has_role?(:super)
            organization_path
        elsif current_user.has_role?(:admin)
            root_path
        elsif current_user.has_role?(:user)
            root_path
        end
    end
end
