class ApplicationController < ActionController::Base
    include Pundit
    # protect_from_forgery
    include ApplicationHelper
    before_action :authenticate_user!

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    def after_sign_in_path_for(resource)
        if current_user.has_role?(:super)
            super_panel_index_path
        elsif isAdmin
            admin_panel_index_path
        elsif isUser
            root_path
        end
    end


    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to( root_path)
    end
end
