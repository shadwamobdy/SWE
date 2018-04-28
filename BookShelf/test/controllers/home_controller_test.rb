require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "assert true" do
    assert true
  end

  test "should get index" do
   	get :index
    assert_response :success
  end

end
