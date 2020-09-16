require "test_helper"

class SendEmailJobTest < ActiveJob::TestCase
  setup do
    @user = users(:one)
    @step = steps(:step_1_1_1)
    @quote = quotes(:quote_1_1)
  end

  test "must send email with WorkflowMailer service" do
    perform_enqueued_jobs only: ActionMailer::MailDeliveryJob do
      SendEmailJob.perform_now(@quote.id, @step.id, @user.id)
      assert_performed_jobs 1
    end
  end

  test "must create a SmsMessage instance" do
    SendEmailJob.perform_now(@quote.id, @step.id, @user.id)
    message = Message.last
    assert_equal "EmailMessage", message.type
    assert_equal @quote, message.quote
    assert_equal @step.body, message.body
    assert_equal @step.title, message.title
  end
end
