if  Rails.env.development?
    # Destroy all database's instances  
    User.destroy_all 

    # Instances creation
    admin = User.create(email: "admin@admin.com", password: "123456", admin: true)
    p "Admin create : #{admin.email}"
end 