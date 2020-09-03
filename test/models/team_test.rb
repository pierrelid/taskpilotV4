require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test "invalid if itx the same name" do
    Team.create(name: "name")
    names = ["name", "Name", "NaMe", "naME"]
    names.each do |name|
      team = Team.new(name: name)
      team.valid?
      assert_not team.errors[:name].empty?, "erreur sur le nom : #{name}"
    end
  end

  test "invalid if name is not present" do
    team = Team.new
    team.valid?
    assert_not team.errors[:name].empty?
  end

  test "valid if name if present" do
    team = Team.new(name: "name")
    team.valid?
    assert_empty team.errors[:name]
  end
end
