json.array! @quotes do |quote|
  json.extract! quote, :id, :first_name, :last_name, :phone, :email
end
