# i = 0
# 25.times {Project.create(name: "proyect i+1 ")}

(1..25).each do |index|
  p = Project.create(name: "project #{index}",description: "content #{index}")
  (1..25).each do |index2|
    Entry.create(project_id: p.id,hours: 23,minutes: 30,comments: "version BETA#{index2}",date: Date.yesterday)
  end
end



# (1..25).each do |index|
# random = Random.new
# Entry.create(project_id: random.rand(25),hour:random.rand(25),minutes:random.rand(25),comment:"hola #{index}",date: Time.now)
# end