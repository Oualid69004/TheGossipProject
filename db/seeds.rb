City.create(nom_ville: "Lyon")#, zip_code: "69003")
10.times do |index|
  City.create(nom_ville: Faker::Address.city)#, zip_code: Faker::Address.zip_code)
  puts "#{index+1} city created"
end

10.times do |index|
  User.create(
      prenom: Faker::Name.first_name,
      nom: Faker::Name.last_name,
      description: Faker::Lorem.paragraphs,
      email: Faker::Internet.free_email,
      age: Faker::Number.between(from: 10, to: 60),
  #city: City.find(rand(1..10))
      )
  puts "#{index+1} user created"
end

10.times do |index|
  Gossip.create(titre: Faker::Quote.yoda, contenu: Faker::Lorem.paragraphs )#, user: User.find(rand(1..10)))
  puts "#{index+1} gossip created"
end