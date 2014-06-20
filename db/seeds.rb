require_relative '../app/models/post'
require_relative '../app/models/tag'
require_relative '../app/models/user'
require 'faker'


  5.times do
    User.create({username: Faker::Name.name, password: 'password',logged_in: false})
  end

  10.times do
    Post.create({title: Faker::Company.catch_phrase, content: Faker::Lorem.paragraph(3), user_id: rand(1..5)
      })
  end

  tags = %w[funny boring pets family sports movies]
  10.times do
    Tag.create({tag: tags.sample, post_id: rand(1..10)})
  end

User.all.each do |user|
  user.username = Faker::Internet.user_name
  user.save
end