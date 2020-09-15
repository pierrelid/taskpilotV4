require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  setup do
    @teams = Team.all
  end

  test "must only execute script on active workflows" do
    #
    Rake::Task["workflow:execution"].execute
    active_workflows = Workflow.where(active: true)
    active_workflows.each do |workflow|
      workflow.list_lines.each do |list_line|
        assert_equal 1, list_line.step.position
      end
    end
    #
    Rake::Task["workflow:execution"].execute
    active_workflows.each do |workflow|
      workflow.list_lines.each do |list_line|
        list_line.reload
        assert_equal 2, list_line.step.position
      end
    end
    Rake::Task["workflow:execution"].execute
    active_workflows.each do |workflow|
      workflow.list_lines.each do |list_line|
        list_line.reload
        assert_equal 3, list_line.step.position
      end
    end
    Rake::Task["workflow:execution"].execute
    active_workflows.each do |workflow|
      workflow.list_lines.each do |list_line|
        list_line.reload
        assert_nil list_line.step
        assert list_line.finish
      end
    end
    unactive_workflows = Workflow.where(active: false)
    unactive_workflows.each do |workflow|
      workflow.list_lines.each do |list_line|
        assert_nil list_line.step
      end
    end
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
