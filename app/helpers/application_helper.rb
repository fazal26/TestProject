module ApplicationHelper
    def is_admin
        if current_user.has_role? :admin, Organization.with_role(:admin, current_user).first
            true
        else
            false
        end
    end

    def is_super
        if current_user.has_role? :super
            true
        else
            false
        end
    end
    
    def is_user
        if current_user.has_role?(:user, Organization.with_role(:user, current_user).first)
            true
        else
            false
        end
    end

    def is_verifier
        if current_user.has_role?(:verifier, Organization.with_role(:verifier, current_user).first)
            true
        else
            false
        end
    end
    
end
