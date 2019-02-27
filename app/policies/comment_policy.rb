class CommentPolicy < ApplicationPolicy

    def create?
        !is_super
    end
    
    def new?
        create?
    end

    def destroy?
        is_self_comment
    end
    
    private
    def is_super
        user.has_role?(:super) 
    end

    def is_self_comment
        user.id == record.user_id
    end
end