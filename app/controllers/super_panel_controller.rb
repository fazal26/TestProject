class SuperPanelController < ApplicationController
    before_action :validate_super
  def index
    @users = User.all.order("created_at DESC")
    
  end

  def manage_user
  end
  def manage_organization
    @orgs = Organization.all.order("created_at DESC")
  end

  private 
  def validate_super
    return true if current_user.has_role?(:super)
end
end
