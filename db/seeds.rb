require 'faker'

puts 'seeding users...'
20.times do
  user = User.create({
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    user_name: Faker::Internet.unique.username,
    password_digest: Faker::Internet.password(min_length: 8),
  })
  user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images','default.jpg')), filename: 'default.jpg', content_type: 'image/jpg')

end

puts 'seeding categories...'
  
categories = [
    {name: "General"},
    {name: "Entertainments"},
    {name: "Sports & Heath"},
    {name: "Books & Arts"},
    {name: "Bussinesses & Marketing"},
    {name: "Kids"},
    {name: "Hobbies & Activities"},
    {name: "Education"},
    {name: "Computers & Gadgets"},
    {name: "Travel"}
]

categories.each do |category|
  Category.create(category)
  end


puts 'seeding posts...'
50.times do
  Post.create({
    category_id: Faker::Number.between(from: 1, to: 10),
    user_id: Faker::Number.between(from: 1, to: 20),
    title: Faker::Company.catch_phrase,
    body: Faker::Quote.matz,
  })
end

puts 'seeding comments...'
100.times do
  Comment.create({
    user_id: Faker::Number.between(from: 1, to: 20),
    post_id: Faker::Number.between(from: 1, to: 20),
    body: Faker::Hipster.sentences.sample
  })
end


puts 'All Done!'