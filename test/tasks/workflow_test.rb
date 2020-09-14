require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  Rails.application.load_tasks

  test "workflow" do
    Rake::Task["workflow:execution"].execute
  end
end
