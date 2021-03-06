class CasePolicy < ApplicationPolicy

  def index?
    is_simple_user
  end
    
  def new?
    is_verifier_user
  end
    
  def create?
    is_verifier_user
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
    is_own_case || is_admin_user
  end

  def home
    true
  end
     
   
  private 
  def is_simple_user
    
    user.has_role?(:user, user.organizations.first) || user.has_role?(:verifier, user.organizations.first)
  end

  def is_admin_user
    user.has_role?(:admin, user.organizations.first)
  end

  def is_verifier_user
    is_admin_user || user.has_role?(:verifier, user.organizations.first)
  end

  def is_own_case
    user.id == record.user_id
  end

end