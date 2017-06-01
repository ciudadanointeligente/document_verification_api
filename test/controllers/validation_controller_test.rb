require 'test_helper'

class ValidationControllerTest < ActionDispatch::IntegrationTest
  test "should get validate" do
    get validation_validate_url
    assert_response :success
  end

end
