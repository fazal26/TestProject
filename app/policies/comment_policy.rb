class CommentPolicy < ApplicationPolicy

    def create?
        !is_admin_or_verifier
    end
    
    def new?
        create?
    end

    def destroy?
        !is_admin_or_verifier
    end
    
    def comment; end
    
    private
    def is_admin_or_verifier
        user.has_role?(:super) || user.has_role?(:user, Organization.with_role(:user, current_user))
    end
end