# frozen_string_literal: true

class User < ApplicationRecord
  resourcify
  rolify 
  
  after_create :assign_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :case
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:simple) if roles.blank?
  end
end
