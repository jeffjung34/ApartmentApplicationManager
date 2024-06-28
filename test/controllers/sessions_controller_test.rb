require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    logout
    get login_url
    assert_response :success
  end

  test "should get create" do
    logout
    post login_url, params: { email: users(:one).email.downcase }
    assert_response :redirect
  end

  test "should get destroy" do
    delete logout_url
    assert_response :redirect
  end
end
