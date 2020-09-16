require "test_helper"
require "minitest/mock"

class InfobipServiceTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette(name)
  end

  teardown do
    VCR.eject_cassette
  end

  test "send_sms" do
    step = steps(:step_1_1_1)
    quote = quotes(:quote_1_1)
    sms = Message.create(body: step.body, quote: quote)
    response = InfobipService.new({ message_id: sms.id }).send_sms
    assert_equal "200", response.code
  end
end
