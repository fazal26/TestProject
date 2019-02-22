class OrganizationPolicy < ApplicationPolicy
    
    def index?
      is_super
    end
  
    def show?
      is_super || is_admin
    end
  
    def create?
      is_super
    end
  
    def new?
      create?
    end
  
    def update?
      is_super
    end
  
    def edit?
      update?
    end
  
    def destroy?
      is_super
    end
    
    private 
    def is_super
        user.has_role?(:super)
    end

    def is_admin
      user.has_role?(:admin , Organization.with_role(:admin, user).first)
    end

  
  end
  