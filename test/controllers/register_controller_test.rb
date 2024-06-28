require "test_helper"

class RegisterControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    logout
    get register_url
    assert_response :success
  end

  test "should create user" do
    logout
    post register_url, params: { user: { email: "homework@isnottoodifficult.com", password: "secret", password_confirmation: "secret" } }

    assert_redirected_to home_url
  end

  test "should fail to create with password mismatch" do
    logout
    post register_url, params: { user: { email: "homework@isnottoodifficult.com", password: "secret", password_confirmation: "notsomuchasecret" } }

    assert_response :unprocessable_entity
  end

end
