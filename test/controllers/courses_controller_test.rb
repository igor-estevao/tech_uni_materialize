require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get courses_path
    assert_response :success
  end
end
