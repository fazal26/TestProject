class Category < ApplicationRecord
    has_many :cases
    enum category_id: [:zakat, :khairat, :sadqa]
end
