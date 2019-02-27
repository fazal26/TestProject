class OrganizationPolicy < ApplicationPolicy
    
    def index?
      is_super
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

    def show?
      is_super
    end
  
    def destroy?
      is_super
    end
    
    private 
    def is_super
        user.has_role?(:super)
    end

  end
  