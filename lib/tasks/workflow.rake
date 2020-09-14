namespace :workflow do
  task execution: :environment do
    @teams = Team.all
    @teams.each { |team| create_list_lines(team) }
  end

  def create_list_lines(team)
    lists = team.lists
    lists.each do |list|
      quotes = Quote.where(team: team, qualification: list.qualification, product: list.product)
      quotes.each { |quote| ListLine.create(list: list, quote: quote) }
    end
  end
end
