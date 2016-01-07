today_concert = Concert.create(band: "u2", venue: "sala el sol", city: "Madrid", 
  date: Date.today, price: 50, description: "great concert")

# (1..10).each do |index|
# new_concert = Concert.create(band: "ramones", venue: "razzmatazz", city: "London", 
#   date: Date.today + (3*index), price: 10 + (index*2), description: "random")
# end
