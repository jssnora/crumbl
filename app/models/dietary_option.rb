class DietaryOption < ApplicationRecord
    has_many :listings_dietary_options
    has_many :listings, through: :listings_dietary_options
end
