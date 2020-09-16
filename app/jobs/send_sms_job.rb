class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(quote_id, step_id)
    step = Step.find(step_id)
    quote = Quote.find(quote_id)
    sms = Message.create(body: step.body, quote: quote)
    InfobipService.new({ message_id: sms.id }).send_sms
  end
end
