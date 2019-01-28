# frozen_string_literal: true

class User < ApplicationRecord
  resourcify
  after_create :assign_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :case
  has_many :user_role
  has_many :role, through: :user_role
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:simple) if roles.blank?
  end
end
