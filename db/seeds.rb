if  Rails.env.development?
    # Destroy all database's instances 
    User.destroy_all
    Team.destroy_all 

    # Teams creation 
    admin_team = Team.create(name: "Admin Team")

    # Users creation
    admin = User.create(team: admin_team, email: "admin@admin.com", password: "123456", admin: true)
    p "Admin create : #{admin.email}"
end 