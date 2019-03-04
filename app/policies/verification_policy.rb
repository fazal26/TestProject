class VerificationPolicy < ApplicationPolicy
    def index?
        false
    end

    def show?
        is_self_verification || is_verifier
    end

    def new?
        is_verifier
    end

    def edit?
        false
    end

    def create?
        is_verifier
    end

    def update?
        false
    end

    def destroy?
        false
    end

    def verification?
        is_verifier
    end

    private
    def is_verifier
        user.has_role?(:admin, user.organizations.first) || (user.has_role?(:verifier, user.organizations.first) && is_self_case)
    end

    def is_self_verification
        user.id == record.user_id
    end
    def is_self_case
        Case.find(record.case_id).user.id != user.id
    end
end