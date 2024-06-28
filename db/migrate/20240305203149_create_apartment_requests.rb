class CreateApartmentRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :apartment_requests do |t|
      t.references :apartment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false

      t.timestamps
    end
  end
end
