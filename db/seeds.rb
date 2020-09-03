if Rails.developement?
    # Destroy all database's instances  
    User.destory_all 

    admin = User.create(email: "admin@admin.com", password: "123456", admin: true)
    p "Admin create :#{admin.email}"
end 