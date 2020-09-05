if Rails.env.development?
  require "faker"

  # Destroy all database's instances
  User.destroy_all
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
  admin_team_products = team_1.products
  team_1_products = team_1.products
  team_2_products = team_2.products

  # Quotes creation
  1.upto(50) do |i|
    Quote.create!(team: admin_team, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, product: admin_team_products.sample)
  end
  1.upto(50) do |i|
    Quote.create!(team: team_1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, product: team_1_products.sample)
  end
  1.upto(50) do |i|
    Quote.create!(team: team_2, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, product: team_2_products.sample)
  end
  p "Quote creation"
end
