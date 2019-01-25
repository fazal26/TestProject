class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :case
  has_one :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
