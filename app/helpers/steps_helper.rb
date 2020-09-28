module StepsHelper
  def display_icon(step)
    case step.type
    when "EmailStep"
      "<i class='fas fa-envelope text-success h2'></i>".html_safe
    when "SmsStep"
      "<i class='fas fa-sms text-info h2'></i>".html_safe
    when "DelayStep"
      "<i class='fas fa-hourglass-start text-danger h2'></i>".html_safe
    else
      "<i class='fas fa-time text-danger h2'></i>".html_safe
    end
  end

  def display_content(step)
    result = ""
    case step.type
    when "EmailStep"
      result += "<p><strong>Sujet :</strong> <div>#{step.title}</div></p>"
      result += "<p><strong>Contenu :</strong> #{step.body.truncate(200)}</p>"
    when "SmsStep"
      result += "<p><strong>Contenu :</strong> #{step.body.truncate(200)}</p>"
    when "DelayStep"
      result += "<p><strong>Delais (en jours) : </strong> #{step.delay}</p>"
    else
      result += "No content, step type is unknow"
    end
    result.html_safe
  end
end
