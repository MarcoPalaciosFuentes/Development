require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get usuario" do
    get :usuario
    assert_response :success
  end

end
