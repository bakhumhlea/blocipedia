require 'faker'
             
##locations = [Faker::StarWars.planet,
##             Faker::Space.galaxy
##            ]
            
8.times do
    usernames = [Faker::WorldOfWarcraft.unique.hero,
             Faker::StarWars.unique.character,
             Faker::DragonBall.unique.character
             ]
    name = usernames[rand(0..usernames.length-1)]
    email = Faker::Internet.free_email
    User.create!(
        username: name,
        email: email,
        password: "12345678"
    )
end
names = ["Kujo Joutarou", "Winsmoke Sanji"]
admin = User.create!(
   username: names[0],
   email:    "joutaro_kujo@morioh.com",
   password: '12345678',
   role:     'admin'
)

premium = User.create!(
   username: names[1],
   email:    "sanji_3@northblue.com",
   password: '12345678',
   role:     'premium'
)

users = User.all

60.times do
    topics = [  Faker::StarWars.quote,
                Faker::BackToTheFuture.quote, 
                Faker::LeagueOfLegends.quote,
                Faker::HarryPotter.quote,
                Faker::WorldOfWarcraft.quote
                ]
    Wiki.create!(
        title:  topics[rand(0..topics.length-1)],
        body:   Faker::Hipster.paragraphs.join(' '),
        private: false,
        user: users.sample
    )
end
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
puts "#{admin.username} is comming!"
puts "#{premium.username} will slash you!"
puts "ex. #{users.sample.email}"