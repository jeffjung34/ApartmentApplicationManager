class DropApartmentRequests < ActiveRecord::Migration[7.1]
  def change
    drop_table :apartment_requests do |t|
    end

  end
end
