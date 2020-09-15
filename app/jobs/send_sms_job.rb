class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(quote_id, step_id)
    step = Step.find(step_id)
    quote = Quote.find(quote_id)
    sms = Message.create(body: step.body, quote: quote)
    InfobipService.new({ message_id: sms.id }).send_sms
  end
end

# quote = Quote.find_by(email: "pierre.liduena@gmail.com")
# step = Step.find_by(type: "SmsStep")
# SendSmsJob.perform_now(quote.id, step.id)
