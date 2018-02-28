require 'random_data'

5.times do
    name = RandomData.random_name
    num = rand(100..999)
    User.create!(
        username: name,
        email: "#{name.downcase}_#{rand(1..99)}@mail.com",
        password: "#{name.downcase}#{num}"
    )
end

admin = User.create!(
   username: 'Kujo Joutaro',
   email:    'admin@email.com',
   password: '12345678',
   role:     'admin'
)

premium = User.create!(
   username: 'Roronoa Zolo',
   email:    'premium@email.com',
   password: '12345678'
)

users = User.all

50.times do
    Wiki.create!(
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph,
        private: false,
        user: users.sample
    )
end
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
puts "#{admin.username} is comming!"
puts "#{premium.username} will slash you!"