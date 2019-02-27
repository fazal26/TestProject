class OptinPolicy < ApplicationPolicy

    def create?
        is_verifier
    end
      
    private
    def is_verifier
        user.has_role?(:admin, user.organization.first) || user.has_role?(:verifier, user.organization.first)
    end

end