require 'faker'
#require 'aws-sdk-s3' 

#s3 = Aws::S3::Resource.new(region: 'us-east-1')

User.destroy_all
puts 'deleteing users...'
Post.destroy_all
puts 'deleteing posts...'
Comment.destroy_all
puts 'deleteing comments...'
Category.destroy_all
puts 'deleteing categories...'
Room.destroy_all
puts 'deleteing rooms...'
RoomMessage.destroy_all
puts 'deleteing rooms messages...'
puts '.........'

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



puts 'seeding users...'

10.times do
  user = User.create({
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    user_name: Faker::Internet.unique.username,
    password: '1234',
  })

  random = rand(1..9)
  user.avatar.attach(io: File.open(Rails.root.join('public','images','avatars',"#{random}"'.png')), filename: "#{random}"'.png', content_type: 'image/png')
 # obj = s3.bucket('rails-connected-webapp').object('#{i}.jpg')   
  #obj.get(response_target: 'public/images/avatars/#{i}.jpg')
  #user.avatar.attach(io: File.open("public/images/avatars/#{i}.png"), filename: "#{i}.png")

end
puts 'seeding an admin'
  admin = User.create({
  first_name: 'admin',
  last_name: 'admin',
  email: 'tanattha.thuneim@gmail.com',
  user_name: 'admin',
  password: '11223344',
  role: 1
})

#obj = s3.bucket('rails-connected-webapp').object('#{i}.jpg')   
#obj.get(response_target: 'public/images/avatars/#{i}.jpg')
#user.avatar.attach(io: File.open("public/images/avatars/#{i}.png"), filename: "#{i}.png")

admin.avatar.attach(io: File.open(Rails.root.join('public','images','avatars','admin.jpg')), filename: 'admin.jpg', content_type: 'image/jpg')

puts 'seeding posts...'
20.times do
  Post.create({
    category_id: Faker::Number.between(from: 1, to: 12),
    user_id: Faker::Number.between(from: 1, to: 10),
    title: Faker::Company.catch_phrase,
    body: Faker::Quote.matz,
  })
end

puts 'seeding comments...'
50.times do
  Comment.create({
    user_id: Faker::Number.between(from: 1, to: 10),
    post_id: Faker::Number.between(from: 1, to: 20),
    body: Faker::Hipster.sentences.sample
  })
end


puts 'All Done!'