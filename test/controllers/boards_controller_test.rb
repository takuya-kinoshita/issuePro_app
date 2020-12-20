require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boards_path
    assert_response :success
  end

  test "should get new" do
    get new_board_path
    assert_response :success
  end

  test "should get edit" do
    get edit_board_path(boards(:one))
    assert_response :success
  end

  test "should get show" do
    get board_path(boards(:one))
    assert_response :success
  end

end
