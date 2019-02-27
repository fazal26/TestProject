class ApplicationController < ActionController::Base
    include Pundit
    include ApplicationHelper
    before_action :authenticate_user!

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    def after_sign_in_path_for(resource)
        if is_super
            super_panel_index_path
        elsif is_admin
            admin_panel_index_path
        elsif is_user || is_verifier
            root_path
        end
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(home_path)
    end
end
