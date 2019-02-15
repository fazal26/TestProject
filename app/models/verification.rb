class Verification < ApplicationRecord
    belongs_to :case
    belongs_to :user
    has_many_attached :files
    validates :check1, :check2, :remarks, :files, presence: true

end
