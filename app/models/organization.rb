class Organization < ApplicationRecord
    resourcify
    has_many :users, through: :roles, class_name: 'User', source: :users
    include ActiveModel::Dirty
    accepts_nested_attributes_for :users
end
