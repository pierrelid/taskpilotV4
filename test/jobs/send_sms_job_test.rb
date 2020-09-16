require "test_helper"

class SendSmsJobTest < ActiveJob::TestCase
  setup do
    VCR.insert_cassette(name)
    @step = steps(:step_1_1_3)
    @quote = quotes(:quote_1_1)
  end

  teardown do
    VCR.eject_cassette
  end

  test "must send sms with Infobip service" do
    response = SendSmsJob.perform_now(@quote.id, @step.id)
    assert_equal "200", response.code
  end

  test "must create a SmsMessage instance" do
    SendSmsJob.perform_now(@quote.id, @step.id)
    message = Message.last
    assert_equal "SmsMessage", message.type
    assert_equal @quote, message.quote
    assert_equal @step.body, message.body
    assert_nil message.title
  end
end
