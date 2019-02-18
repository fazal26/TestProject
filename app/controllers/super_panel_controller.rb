class SuperPanelController < ApplicationController
  before_action :validate_super
  before_action :get_users, only:[:index, :manage_user]
  
  def index
    
  end

  def manage_user;
  end

  private 
  def validate_super
    return true if current_user.has_role?(:super)
  end

  def get_users
    @users = User.all.order("created_at DESC")  
  end

  
end
