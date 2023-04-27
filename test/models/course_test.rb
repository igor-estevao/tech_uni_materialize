require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @course = Course.new short_name: "CSS1", name: "Cascate Style Sheet 1", description: "Course design to teach all the basics skills of CSS tech"
  end
  test "Course name is present" do
    course = @course
    course.name = ""
    assert_not course.valid?
  end

  test "Course name length minimum invalid" do
    course = @course
    course.name = "1234"
    assert_not course.valid?
  end

  test "Course name length maximum invalid" do
    course = @course
    course.name = "Long description that length passes the 50 maximum characteres limit"
    assert_not course.valid?
  end
  test "Course short name is present" do
    course = @course
    course.short_name`` = ""
    assert_not course.valid?
  end

  test "Course short name length minimum invalid" do
    course = @course
    course.short_name = "1234"
    assert_not course.valid?
  end

  test "Course short name length maximum invalid" do
    course = @course
    course.short_name = "Long name that length passes the 50 maximum characteres limit"
    assert_not course.valid?
  end
end
