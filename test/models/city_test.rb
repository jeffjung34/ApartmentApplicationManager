require "test_helper"

class CityTest < ActiveSupport::TestCase

  test "city name must be present" do
    city = City.new(name: nil)
    assert city.invalid?
    assert city.errors[:name].any?
  end

  test "city is not valid without a unique name" do
    new_york_city = cities(:new_york_city)
    duplicate_city = City.new(name: new_york_city.name)
    assert duplicate_city.invalid?
    assert duplicate_city.errors.of_kind? :name, :taken
  end
end
