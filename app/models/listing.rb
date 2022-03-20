class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listings_dietary_options, dependent: :destroy
  has_many :dietary_options, through: :listings_dietary_options

  has_one_attached :picture

  #Data validation
  validates :name, :description, :price, presence: true
  validates :name, length: {minimum: 3, maximum: 50}

  #Data sanitisation
  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?

  private 
  
  def remove_whitespace 
    self.name = self.name.strip
    self.description = self.description.strip
  end
  
  def convert_price_to_cents 
    self.price = (self.attributes_before_type_cast["price"].to_f * 100).round(2)
  end 

end
