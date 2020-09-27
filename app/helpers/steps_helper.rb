module StepsHelper
  def display_icon(step)
    case step.type
    when "EmailStep"
      "<i class='fas fa-envelope text-success h2'></i>".html_safe
    when "SmsStep"
      "<i class='fas fa-sms text-info h2'></i>".html_safe
    when "DelayStep"
      "<i class='fas fa-hourglass-start text-warning h2'></i>".html_safe
    else
      "<i class='fas fa-time text-danger h2'></i>".html_safe
    end
  end
end
