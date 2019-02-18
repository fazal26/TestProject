class Case < ApplicationRecord
    
    enum status: [:proposed, :approved, :rejected, :verified, :closed]
    
    belongs_to :user
    belongs_to :organization
    belongs_to :category
    has_many_attached :files
    has_many :comments
    has_many :verifications
end
