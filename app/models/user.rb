# frozen_string_literal: true

class User < ApplicationRecord
  resourcify
  rolify 
  
  after_create :assign_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :case
  belongs_to :organization
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:user) if roles.blank?
  end
end
