class ListingsDietaryOption < ApplicationRecord
  belongs_to :listing
  belongs_to :dietary_option
end
