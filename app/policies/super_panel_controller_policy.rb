class SuperPanelControllerPolicy < ApplicationPolicy

    def index?
        is_super
    end

    def manage_user?
        is_super
    end

    private 
    def is_super
        user.has_role?(:super)
    end

end
