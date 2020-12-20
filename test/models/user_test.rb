require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                      password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    #@userがvalidであればテストはerrorになる
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.name = "a"*5
    assert_not @user.valid?
  end

  test "email validation should be accept valid addresses" do
    valid_addresses = %w[user@gmail.com Uset@FOO.COM useww@ggGG.jp]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "email validation should be reject invalid addresses" do
    invalid_addresses = %w[qqq.com eee@com aaa@gmail,com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?

  end
end
