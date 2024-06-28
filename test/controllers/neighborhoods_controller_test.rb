require "test_helper"

class NeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood = neighborhoods(:back_bay)
    @city = cities(:boston)
  end

  test "should get index" do
    get city_neighborhoods_url(@city)
    assert_response :success
  end

  test "should get new" do
    get new_city_neighborhood_url(@city)
    assert_response :success
  end

  test "should create neighborhood" do
    assert_difference("Neighborhood.count") do
      post city_neighborhoods_url(@city), params: { neighborhood: { city_id: @neighborhood.city_id, name: @neighborhood.name } }
    end

    assert_redirected_to city_neighborhood_url(@city, Neighborhood.last)
  end

  test "should show neighborhood" do
    get city_neighborhood_url(@city, @neighborhood)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_neighborhood_url(@city, @neighborhood)
    assert_response :success
  end

  test "should update neighborhood" do
    patch city_neighborhood_url(@city, @neighborhood), params: { neighborhood: { city_id: @neighborhood.city_id, name: @neighborhood.name } }
    assert_redirected_to city_neighborhood_url(@city, @neighborhood)
  end

  test "should destroy neighborhood" do
    assert_difference("Neighborhood.count", -1) do
      delete city_neighborhood_url(@city, @neighborhood)
    end

    assert_redirected_to city_neighborhoods_url(@city)
  end
end