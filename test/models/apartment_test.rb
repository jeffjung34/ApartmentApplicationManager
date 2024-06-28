require "test_helper"

class ApartmentTest < ActiveSupport::TestCase
  test "apartment street_address must be present" do
    apartment = Apartment.new(street_address: nil)
    assert apartment.invalid?
    assert apartment.errors[:street_address].any?
  end

  test "apartment rent must be greater than 100" do
    apartment = Apartment.new(street_address: "whatever", rent: 50)
    assert apartment.invalid?
    assert apartment.errors[:rent].any?
  end

  test "apartment bedrooms must be greater than 1" do
    apartment = Apartment.new(street_address: "whatever", bedrooms: 0)
    assert apartment.invalid?
    assert apartment.errors[:bedrooms].any?
  end


end
