require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

end
