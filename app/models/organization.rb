class Organization < ApplicationRecord
    has_many :users
    accepts_nested_attributes_for :users

    after_create :assign_admin

    def assign_admin
        puts "**************"*20
        puts params.inspect
    end
end
