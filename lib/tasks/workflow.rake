namespace :workflow do
  task execution: :environment do
    teams = Team.all
    teams.each { |team| create_list_lines(team) }
    teams.each { |team| update_waiting_list_lines(team) }
    teams.each { |team| workflows_execution(team) }
  end

  def update_waiting_list_lines(team)
    list_lines = team.list_lines.where(finish: false, waiting: true)
    list_lines.each do |list_line|
      update_condition = DateTime.now - list_lines.waiting_start >= list_lines.seconds_to_wait
      list_line.update(waiting: false, seconds_to_wait: 0, waiting_start: nil) if update_condition
    end
  end

  def workflows_execution(team)
    active_workflows = team.workflows.where(active: true)
    active_workflows.each do |workflow|
      steps = workflow.steps.order(position: :asc)
      list_lines = workflow.list_lines.where(finish: false, waiting: false)
      list_lines.each do |list_line|
        if list_line.step.nil?
          list_line.update(step: steps.first)
          step_execution(list_line)
        else
          current_step = list_line.step
          next_step = steps.find_by(position: current_step.position + 1)
          if next_step.present?
            list_line.update(step: next_step)
            step_execution(list_line)
          else
            list_line.update(step: nil, finish: true, waiting: false)
          end
        end
      end
    end
  end

  def step_execution(list_line)
    case list_line.step.type
    when "EmailStep"
    when "SmsStep"
    when "DelayStep"
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
