namespace :workflow do
  task execution: :environment do
    teams = Team.all
    # create list lines
    teams.each { |team| create_list_lines(team) }
    # crawl actives workflow
    active_workflows = Workflow.where(active: true)
    active_workflows.each do |workflow|
      steps = workflow.steps.order(position: :asc)
      list_lines = workflow.list_lines.where(finish: false)
      list_lines.each do |list_line|
        # on update le step du list_line
        if list_line.step.nil?
          list_line.update(step: steps.first)
          step_execution(list_line)
        else
          current_step = list_line.step
          next_step = steps.find_by(position: current_step.position + 1)
          if next_step.present?
            list_line.update(step: next_step)
            list_line.reload
            step_execution(list_line)
          else
            p "finish"
            list_line.update(step: nil, finish: true)
          end
        end
      end
    end
  end

  def step_execution(list_line)
    case list_line.step.type
    when "EmailStep"
      p "Email Step"
    when "SmsStep"
      p "Sms Step"
    when "DelayStep"
      p "Delay Step"
    else
    end
  end

  def create_list_lines(team)
    lists = team.lists
    lists.each do |list|
      quotes = Quote.where(team: team, qualification: list.qualification, product: list.product)
      quotes.each { |quote| ListLine.create(list: list, quote: quote) unless ListLine.find_by(list: list, quote: quote).present? }
    end
  end
end
