class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listings_dietary_options, dependent: :destroy
  has_many :dietary_options, through: :listings_dietary_options

  has_one_attached :picture

end
