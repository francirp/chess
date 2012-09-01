require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get board" do
    get :board
    assert_response :success
  end

end
