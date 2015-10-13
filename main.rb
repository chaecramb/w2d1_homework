require "pry-byebug"
require_relative "building"
require_relative "lift"
require_relative "person"

castle_grey_skull = Building.new(name: "Castle Grey Skull", 
  post_code: "PH3 9DR",
  floors: "11",
  lifts: 4  )

# Create people 
he_man = Person.new(name: "He-Man", destination: 4)
cringer = Person.new(name: "Cringer", destination: 11)
man_at_arms = Person.new(name: "Man at Arms", destination: 11)
skeletor = Person.new(name: "Skeletor", destination: 0)

# People enter Castle Grey Skull
[he_man, cringer, man_at_arms, skeletor].each { |person| person.enter_building(castle_grey_skull) } 

# He-Man enters lift, goes up 4 floors, gets out onto the 4th floor
he_man.enter_lift(castle_grey_skull.closest_lift(he_man.current_floor))
4.times { castle_grey_skull.lifts.first.go_up }
he_man.exit_lift(castle_grey_skull.lifts.first)

# Cringer and Man-at-Arms enter lift
# It's a different one this time as the closest lift if no longer the first lift which is now on 4
[cringer, man_at_arms].each do |person|
  person.enter_lift(castle_grey_skull.closest_lift(he_man.current_floor))
end

# They try to go up 99 floors, but can't because Castle Grey Skull only has 11
99.times { castle_grey_skull.lifts[1].go_up }

# Cring and Man-at-Arms exit the lift onto the 11th floor
[cringer, man_at_arms].each do |person|
  person.exit_lift(castle_grey_skull.lifts[1])
end

binding.pry






