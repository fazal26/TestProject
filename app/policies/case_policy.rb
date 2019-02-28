class CasePolicy < ApplicationPolicy

  def index?
    is_user
  end
    
  def new?
    create?
  end
    
  def create?
    is_verifier
  end
  
  def show?
    true
  end
  
  def edit?
    update?
  end

  def update?
    is_own_case
  end
    
  def destroy?
    is_own_case || is_admin
  end
     
   
  private 
  def is_user
    user.has_role?(:user, user.organizations.first) || user.has_role?(:verifier, user.organizations.first)
  end

  def is_admin
    user.has_role?(:admin, user.organizations.first)
  end

  def is_verifier
    user.has_role?(:admin, user.organizations.first) || user.has_role?(:verifier, user.organizations.first)
  end

  def is_own_case
    user.id == record.user_id
  end

end