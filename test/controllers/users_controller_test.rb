require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  def setup
    @user = User.new(name: "Fake Name", email: "email@example.com")
  end

  test "should be a valid user" do
      assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should be less than 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be less than 50 characters" do
    @user.email = "a" * 100
    assert_not @user.valid?
  end

  test "should be a valid email" do
    valid_addresses = %w[user@example.com USER@FOOBAR.COM A_EMAIL-USER@FOOBAR.NEW.COM]
    
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "should be invalid emails" do
    invalid_addresses = %w[user@example,com foo_at_bar.com user_name@example. foobar@baz_foo.com foo@baz+bar.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "Address valid #{invalid_address.inspect} should be invalid"
    end
  end
end
