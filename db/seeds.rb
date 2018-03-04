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
    wiki = Wiki.create!(
        title:  "#{topics[rand(0..topics.length-1)]} #{topics[rand(0..topics.length-1)]}",
        body:   Faker::Hipster.paragraphs.join(' '),
        private: false,
        user: users.sample
    )
    wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

wikis = Wiki.all

wikis.each do |w|
    rand(1..3).times do
        col_id = users.pluck(:id)
        Collaborator.create!(
            user_id: col_id.slice!(rand(0..col_id.length-1)),
            wiki_id: w.id
        ) 
    end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Collaborator.count} collaborators have created"
my_wiki = wikis.sample
col = Collaborator.where(wiki_id: my_wiki.id)
my_wiki_col = User.where(id: col.pluck(:user_id))
puts "This wiki id: #{my_wiki.id} has/have #{my_wiki_col.count} collaborator(s)"
puts "#{admin.username} is comming!"
puts "#{premium.username} will cook you!"
puts "ex. #{users.sample.email}"