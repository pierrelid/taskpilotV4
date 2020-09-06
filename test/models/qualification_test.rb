require "test_helper"

class QualificationTest < ActiveSupport::TestCase
  test "default_names_for_lists must return default names for list creation" do
    assert_equal ["Jamais démarché"], Qualification.default_names_for_lists
  end

  test "default_names must return default names" do
    assert_equal ["Jamais démarché", "Lead chaud", "Rendez-vous pris", "Sans suite"], Qualification.default_names
  end

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
