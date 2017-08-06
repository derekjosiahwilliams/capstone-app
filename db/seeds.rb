# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "email@email.com", username: "d.j.will", password: "password")

User.create(email: "josiah@email.com", username: "derek.j.williams", password: "password")

Art.create(photo_url: "url1", drawing_data: "sketch4", user_id: "2")

Art.create(photo_url: "url2", drawing_data: "sketch5", user_id: "2")


Art.create(photo_url: "url3", drawing_data: "sketch6", user_id: "1")
