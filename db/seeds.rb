# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |t|
  Topic.create!(
    title: Faker::Address.country
  )
end

10.times do | blog |
  Blog.create!(
    title: Faker::Food.spice,
    body: Faker::Food.description,
    topic_id: Topic.last.id
  )
  end
9.times do |portfolio_item|
  Portfolio.create!(
    title: Faker::Food.dish,
    description: Faker::Food.ingredient,
    body: Faker::Food.description,
    main_image: "https://via.placeholder.com/600x400.png",
    thumb_image: "https://via.placeholder.com/350x200.png",
  )
end