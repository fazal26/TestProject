module ApplicationHelper
    def isAdmin
        if current_user.has_role? :admin, Organization.with_role(:admin, current_user).first
            return true
        else
            return false
        end
    end
    def isUser
        if current_user.has_role? :user, Organization.with_role(:user, current_user).first
            return true
        else
            return false
        end
    end
end
