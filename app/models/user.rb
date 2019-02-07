class User < ApplicationRecord
  resourcify
  rolify 
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :case
  belongs_to :organization, required: false
  
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

end
