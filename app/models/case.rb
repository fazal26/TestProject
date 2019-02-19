class Case < ApplicationRecord
    
    enum status: [:proposed, :approved, :rejected, :verified, :closed]
    
    belongs_to :user
    belongs_to :organization
    belongs_to :category
    has_many_attached :files, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :verifications, as: :commentable, dependent: :destroy
end
