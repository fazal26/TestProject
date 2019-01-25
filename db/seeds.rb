# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!([
    {
        name: "super", desc: "Super Admin who has the power of all."
    },
    {
        name: "admin", desc: "Admin of a specific organization"
    },
    {
        name: "user", desc: "Employee working under a company"
    }
])
user = User.new({
    email: "admin@admin.com",
    password: "111111",
    password_confirmation: "111111",
    role: 0,
    username: "Admin" 
})
user.save!