if Rails.env.development?
  require "faker"
  Faker::Config.locale = "fr"

  # Destroy all database's instances
  Team.destroy_all

  # Teams creation
  admin_team = Team.create(name: "Admin Team")
  p "Team admin create : #{admin_team.name}"
  team_1 = Team.create(name: "Team 1")
  p "Team admin create : #{admin_team.name}"
  team_2 = Team.create(name: "Team 2")
  p "Team admin create : #{admin_team.name}"

  # Users creation
  admin = User.create(team: admin_team, first_name: "pierre", last_name: "liduena", email: "pierre.liduena@gmail.com", password: "123456", admin: true)
  p "Admin create : #{admin.email}"

  # Team 1's users
  1.upto(2) do |i|
    User.create!(team: team_1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password: "123456", admin: true)
  end
  p " Team 1's users creation"
  # Team 2's users
  1.upto(2) do |i|
    User.create!(team: team_2, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password: "123456", admin: true)
  end
  p " Team 2's users creation"

  # Products
  admin_team_products = admin_team.products
  team_1_products = team_1.products
  team_2_products = team_2.products

  # Qualifications
  admin_team_qualifications = admin_team.qualifications
  team_1_qualifications = team_1.qualifications
  team_2_qualifications = team_2.qualifications

  # Quotes creation
  1.upto(50) do |i|
    Quote.create!(team: admin_team, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, phone: Faker::PhoneNumber.cell_phone, product: admin_team_products.sample, qualification: admin_team_qualifications.sample)
  end
  Quote.create!(team: admin_team, first_name: "Pierre", last_name: "Liduena", email: "pierre.liduena@gmail.com", phone: "+33685694571", product: admin_team_products.sample, qualification: admin_team_qualifications.sample)

  1.upto(50) do |i|
    Quote.create!(team: team_1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, phone: Faker::PhoneNumber.cell_phone, product: team_1_products.sample, qualification: team_1_qualifications.sample)
  end
  1.upto(50) do |i|
    Quote.create!(team: team_2, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, phone: Faker::PhoneNumber.cell_phone, product: team_2_products.sample, qualification: team_1_qualifications.sample)
  end
  p "Quote creation"

  Rake::Task["workflow:execution"].execute
  p "ListLine creation"

  workflow = Workflow.create(name: "workflow", list: admin_team.lists.first, active: true, user: admin_team.users.first)
  p "Create workflow"

  Step.create(workflow: workflow, type: "EmailStep", body: "body", title: "title")
  Step.create(workflow: workflow, type: "DelayStep", delay: 3)
  Step.create(workflow: workflow, type: "SmsStep", body: "body")
  p "Create Step"

  # initalize sidekiq

  require "sidekiq/api"
  Sidekiq.redis { |c| c.del("stat:processed") }
  Sidekiq.redis { |c| c.del("stat:failed") }
  Sidekiq::Queue.new("infinity").clear
  Sidekiq::RetrySet.new.clear
  Sidekiq::ScheduledSet.new.clear
end
