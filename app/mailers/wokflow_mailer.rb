class WokflowMailer < ApplicationMailer
  def personal(quote, user, email)
    mail to: "pierre.liduena@gmail.com"
  end
end
