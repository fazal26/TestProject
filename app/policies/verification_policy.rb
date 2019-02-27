class VerificationPolicy < ApplicationPolicy
    def index?
        false
    end

    def show?
        is_self_verification
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
        puts "XXXXXXXXXXXXXXXXXXXXXXXXXXX\n"*99
        user.has_role?(:admin, user.organizations.first) || user.has_role?(:verifier, user.organizations.first)
    end

    def is_self_verification
        user.id == record.user_id
    end
end