# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

new_york = City.create!(name: "New York City", state: "New York", country: "USA")
boston = City.create!(name: "Boston", state: "Massachusetts", country: "USA")
lower_east_side = Neighborhood.create!(name: "Lower East Side", city: new_york)
back_bay = Neighborhood.create!(name: "Back Bay", city: boston)
cambridge = Neighborhood.create!(name: "Cambridge", city: boston)
marlborough_apt = Apartment.create!(street_address: "372 Marlborough St.", rent: 825, bedrooms: 1, notes: "My rent in 1990", neighborhood: back_bay, city: boston)
newbury_apt = Apartment.create!(street_address: "350 Newbury St", rent: 4000, bedrooms: 3, notes: "Right next to Newbury comics!", neighborhood: back_bay, city: boston)
highland_apt = Apartment.create!(street_address: "290 Highland Ave", rent: 1800, bedrooms: 2, notes: "My rent in 1995", neighborhood: cambridge, city: boston)
soho_apt = Apartment.create!(street_address: "123 Houston Street", bedrooms: 3, rent: 3000, notes: "near Death & Co.", neighborhood: lower_east_side, city: new_york)
User.create!(email: "jon@jonphillips.com", password: "secret", password_confirmation: "secret")
User.create!(email: "jon.phillips@duke.edu", password: "secret", password_confirmation: "secret")
