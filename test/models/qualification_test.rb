require "test_helper"

class QualificationTest < ActiveSupport::TestCase
  test "valid if name is present" do
    qualification = Qualification.new(name: "name")
    qualification.valid?
    assert_empty qualification.errors[:name]
  end

  test "invalid if name is not present" do
    qualification = Qualification.new
    qualification.valid?
    assert_not qualification.errors[:name].empty?
  end
end
