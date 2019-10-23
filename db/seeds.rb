users = [
    {fname: 'Jon', lname: 'Doe', email: 'e@example.com'},
    {fname: 'Jane', lname: 'Doe', email: 'e@example.com'}
]

users.each do |u|
  User.create(u)
end
