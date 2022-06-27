require "test_helper"

class ExchnageratesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exchnagerates_index_url
    assert_response :success
  end

  test "should get create" do
    get exchnagerates_create_url
    assert_response :success
  end
end
