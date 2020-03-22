# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# # User.create!(
# #    email: 'test@test.com',
# #    password: '111111',
# # )

# 10.times do |n|
#   email    = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                )
# end

# users = User.order(:created_at).take(6)
# # ユーザーの上から６人使用
# 10.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.posts.create!(content: content) }
# end