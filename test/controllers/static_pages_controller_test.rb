require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get front" do
    get :front
    assert_response :success
  end

end
