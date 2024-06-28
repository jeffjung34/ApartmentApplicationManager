class CreateApartments < ActiveRecord::Migration[7.1]
  def change
    create_table :apartments do |t|
      t.string :street_address, null: false
      t.integer :bedrooms
      t.decimal :rent
      t.text :notes
      t.references :neighborhood, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
