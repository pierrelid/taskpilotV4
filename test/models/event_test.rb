require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "invalid if start is not present" do
    event = Event.new
    event.valid?
    assert_not event.errors[:start].empty?
  end
end
