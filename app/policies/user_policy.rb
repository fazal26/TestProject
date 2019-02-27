class UserPolicy < ApplicationPolicy
    
    def index?
      false
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
      is_self
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
      user.has_role?(:admin , user.organizations.first)
    end
    
    def is_self
      user.id == record.id
    end

  
  end
  