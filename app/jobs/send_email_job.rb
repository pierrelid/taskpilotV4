class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(quote_id, user_id)
    quote = Quote.find(quote_id)
    user = User.find(user_id)
    WokflowMailer.personal(quote, user).deliver_later
  end
end
