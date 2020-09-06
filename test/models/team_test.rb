require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test "list creation after team creation" do
    team = Team.create(name: "name")
    names = []
    Qualification.default_names_for_lists.each do |qualification_name|
      Product.default_names.each do |product_name|
        names << "#{product_name} : #{qualification_name}"
      end
    end
    assert_equal ["AUTO : Jamais démarché", "MRH : Jamais démarché", "SANTE : Jamais démarché"].sort, team.lists.map(&:name).sort
  end

  test "qualification creation after team creation" do
    team = Team.create(name: "name")
    assert_equal Qualification.default_names.sort, team.qualifications.map(&:name).sort
  end

  test "product creation after team creation" do
    team = Team.create(name: "name")
    assert_equal ["MRH", "AUTO", "SANTE"].sort, team.products.map(&:name).sort
  end

  test "invalid if the name already exists" do
    Team.create(name: "name")
    names = ["name", "Name", "NaMe", "naME"]
    names.each do |name|
      team = Team.new(name: name)
      team.valid?
      assert_not team.errors[:name].empty?, "must be casesensitive with : #{name}"
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
