class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(quote_id, step_id, user_id)
    quote = Quote.find(quote_id)
    user = User.find(user_id)
    step = Step.find(step_id)
    email = EmailMessage.create(title: step.title, body: step.body, quote: quote)
    WokflowMailer.personal(quote, user, email).deliver_later
  end
end
