class UsersRole < ApplicationRecord
  # self.table_name = "users_role"
    

  belongs_to :user
  belongs_to :role
end
