Role.create!([
    {name: "super"},
    {name: "admin"},
    {name: "user"}
])
Category.create!([
    {name: "Zakat"},
    {name: "Khairat"},
    {name: "Sadqa"}
])

user = User.new({
    email: "admin@admin.com",
    username: "Super Cool Admin"
    password: "111111",
    password_confirmation: "111111",
})

user.add_role(:super)
user.save!