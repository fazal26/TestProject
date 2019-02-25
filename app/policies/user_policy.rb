class UserPolicy < ApplicationPolicy
    
    def index?
      is_super || is_admin
    end
  
    def show?
      true
    end
  
    def create?
      is_super || is_admin
    end
  
    def new?
      create?
    end
  
    def update?
      true
    end
  
    def edit?
      update?
    end
  
    def destroy?
      is_super || is_admin
    end
    
    private 
    def is_super
        user.has_role?(:super)
    end

    def is_admin
      user.has_role?(:admin , Organization.with_role(:admin, user).first)
    end
    
    def is_self
        
    end

  
  end
  