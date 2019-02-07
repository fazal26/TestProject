class Organization < ApplicationRecord
    resourcify
    include ActiveModel::Dirty
    has_many :users
    accepts_nested_attributes_for :users

end
