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
        # if current_user.has_roles?([:user, :verifier], Organization.with_role(:user, current_user).first)
        #     return true
        # else
        #     return false
        return true
        # end
    end
    
end
