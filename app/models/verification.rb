class Verification < ApplicationRecord
    belongs_to :case
    belongs_to :user
    has_many_attached :files
    has_many :comments
    validates :check1, :check2, :remarks, :files, presence: true

end
