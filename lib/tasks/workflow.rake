namespace :workflow do
  task execution: :environment do
    teams = Team.all
    teams.each do |team|
      team.lists.each { |list| list.create_list_lines }
      team.workflows.each { |workflow| workflow.update_waiting_list_lines }
      team.active_workflows.each { |workflow| workflow.execution }
    end
  end
end
