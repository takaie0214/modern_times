require 'test_helper'

class GoogleControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get google_create_url
    assert_response :success
  end

  test "should get destroy" do
    get google_destroy_url
    assert_response :success
  end

end
