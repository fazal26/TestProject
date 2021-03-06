class Verification < ApplicationRecord
    belongs_to :case
    belongs_to :user
    has_many_attached :files
    has_many :comments, as: :commentable, dependent: :destroy
    validates :check1, :check2, :remarks, presence: true

end
