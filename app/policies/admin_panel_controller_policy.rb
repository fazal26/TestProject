class AdminPanelControllerPolicy < ApplicationPolicy

    def index?
        is_admin
    end

    def manage_user?
        is_admin
    end

    def manage_case?
        is_admin
    end

    private 
    def is_admin
        user.has_role?(:admin , Organization.with_role(:admin, user).first)
    end

end
