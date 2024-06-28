require "application_system_test_case"

class NeighborhoodsTest < ApplicationSystemTestCase
  setup do
    @neighborhood = neighborhoods(:one)
  end

  test "visiting the index" do
    visit neighborhoods_url
    assert_selector "h1", text: "Neighborhoods"
  end

  test "should create neighborhood" do
    visit neighborhoods_url
    click_on "New neighborhood"

    fill_in "City", with: @neighborhood.city_id
    fill_in "Name", with: @neighborhood.name
    click_on "Create Neighborhood"

    assert_text "Neighborhood was successfully created"
    click_on "Back"
  end

  test "should update Neighborhood" do
    visit neighborhood_url(@neighborhood)
    click_on "Edit this neighborhood", match: :first

    fill_in "City", with: @neighborhood.city_id
    fill_in "Name", with: @neighborhood.name
    click_on "Update Neighborhood"

    assert_text "Neighborhood was successfully updated"
    click_on "Back"
  end

  test "should destroy Neighborhood" do
    visit neighborhood_url(@neighborhood)
    click_on "Destroy this neighborhood", match: :first

    assert_text "Neighborhood was successfully destroyed"
  end
end
