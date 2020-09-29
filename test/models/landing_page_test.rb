require "test_helper"

class LandingPageTest < ActiveSupport::TestCase
  test "must set slug before validation" do
    landing_page = LandingPage.new
    landing_page.valid?
    assert landing_page.slug.present?
  end

  test "invalid if team is not present" do
    landing_page = LandingPage.new
    landing_page.valid?
    assert_not landing_page.errors[:team].empty?
  end

  test "valid if team is present" do
    landing_page = LandingPage.new(team: teams(:one))
    landing_page.valid?
    assert_empty landing_page.errors[:team]
  end
end
