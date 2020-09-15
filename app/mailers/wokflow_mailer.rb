class WokflowMailer < ApplicationMailer
  def personal(quote, user)
    mail to: "pierre.liduena@gmail.com"
  end
end
