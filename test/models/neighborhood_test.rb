require "test_helper"

class NeighborhoodTest < ActiveSupport::TestCase

  test "neighborhood name must be present" do
    neighborhood = Neighborhood.new(name: nil)
    assert neighborhood.invalid?
    assert neighborhood.errors[:name].any?
  end

end
