require 'faker'

puts 'seeding users...'
20.times do
  user = User.create({
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    user_name: Faker::Internet.unique.username,
    password: '1234',
  })
  random = rand(1..9)
  user.avatar.attach(io: File.open(Rails.root.join('public','images','avatars',"#{random}"'.png')), filename: "#{random}"'.png', content_type: 'image/png')

end

puts 'seeding an admin'
user = User.create({
  first_name: 'admin',
  last_name: 'admin',
  email: 'tanattha.thuneim@gmail.com',
  user_name: 'admin',
  password: '11223344',
  role: 1
})
  user.avatar.attach(io: File.open(Rails.root.join('public', 'images','avatars','admin.jpg')), filename: 'admin.jpg', content_type: 'image/jpg')

puts 'seeding categories & rooms...'
  
categories = [
    {name: "General"},
    {name: "Entertainments"},
    {name: "Sports & Heath"},
    {name: "Arts and Crafts"},
    {name: "Bussiness & Marketing"},
    {name: "Kids & Babies"},
    {name: "Hobbies & Activities"},
    {name: "Education"},
    {name: "Computers & Gadgets"},
    {name: "Travel"},
    {name: "Home & Garden"},
    {name: "Fictions & Comics"}
]

categories.each do |category|
  Category.create(category)
  Room.create(category)
  end

  
puts 'seeding posts...'
50.times do
  Post.create({
    category_id: Faker::Number.between(from: 1, to: 12),
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