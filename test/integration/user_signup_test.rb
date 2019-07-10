require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "Invalid Signup Info" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, 
      params: {user:{ name: "", email: "test@invalid", password: "test", password_confirmation: "te$t" }}
    end
    assert_template 'users/new'
  end

  test "valid sign up information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, 
      params: {user:{ name: "Exmaple User", email: "user@example.com", password: "test123", password_confirmation: "test123"}}
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
