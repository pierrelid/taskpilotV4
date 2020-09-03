ActiveAdmin.register User do
  index do
    column :id
    column("Full Name") { |user| user.full_name }
    column :email
    column("Log as") { |user| link_to "Login As", masquerade_path(user) }
    actions
  end
end
