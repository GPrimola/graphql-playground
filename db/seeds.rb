3.times do |n|
  User.create(
    name: "User#{n}",
    email: "useremail#{n}@example.com",
    password: "secure-password#{n}"
  )
end

10.times do |n|
  Link.create(
    url: "path-to-link-#{n}",
    description: "This is the link ##{n}",
    user: User.order('RANDOM()').first
  )
end
