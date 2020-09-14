require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  Rails.application.load_tasks

  setup do
    @teams = Team.all
  end

  test "workflow must create list_lines for each quote" do
    Rake::Task["workflow:execution"].execute
    @teams.each do |team|
      lists = team.lists
      lists.each do |list|
        quotes = Quote.where(team: team, qualification: list.qualification, product: list.product)
        assert_equal quotes.count, list.list_lines.count
      end
    end
  end
end
