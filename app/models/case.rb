class Case < ApplicationRecord
    
    enum status: [:proposed, :approved, :rejected, :pending, :verified]
    
    belongs_to :user
    belongs_to :category
end
