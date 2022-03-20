class CreateListingsDietaryOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :listings_dietary_options do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :dietary_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
