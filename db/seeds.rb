if Rails.env.development?
  # Destroy all database's instances
  User.destroy_all
  Team.destroy_all

  # Teams creation
  admin_team = Team.create(name: "Admin Team")
  p "Team admin create : #{admin_team.name}"

  # Users creation
  admin = User.create(team: admin_team, first_name: "pierre", last_name: "liduena", email: "pierre.liduena@gmail.com", password: "123456", admin: true)
  p "Admin create : #{admin.email}"
end
