namespace :workflow do
  task execution: :environment do
    teams = Team.all
    # create list lines
    teams.each { |team| create_list_lines(team) }
    # crawl workflow
    active_workflows = Workflow.where(active: true)
    active_workflows.each do |workflow|
      list_lines = workflow.list_lines
      list_lines.each do |list_line|
        # if list_line.step.nil?

        # else
        #   current_step = list_line.step
        # end
      end
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
