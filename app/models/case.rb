class Case < ApplicationRecord
    
    enum status: [:proposed, :approved, :rejected, :verified, :closed]
    
    belongs_to :user
    belongs_to :category
    has_many_attached :files
    has_many :comments
end
