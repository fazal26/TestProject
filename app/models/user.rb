class User < ApplicationRecord
  rolify

  has_many :users_roles
  has_many :roles, through: :users_roles

  has_many :case
  has_many :organizations, through: :roles, class_name: 'Organization', source: :resource, source_type: 'Organization'

  
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


end
