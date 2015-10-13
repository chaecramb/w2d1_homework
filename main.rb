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
man_at_arms = Person.new(name: "Man at Arms", destination: 2)
skeletor = Person.new(name: "Skeletor", destination: 0)

# People enter Castle Grey Skull
castle_grey_skull.enter he_man 
castle_grey_skull.enter cringer
castle_grey_skull.enter man_at_arms
castle_grey_skull.enter skeletor

binding.pry

castle_grey_skull.lifts[0].enter he_man
4.times { castle_grey_skull.lifts[0].go_up }
castle_grey_skull.lifts[0].get_out he_man


# The stuff below isn't fully implemented yet. Some of it works, some of it doesn't.
# The working part is basically what's above - people can be moved around manually
# like in lines 25 to 27.




raise




# For each person, check if they are on the floor they want to be on
castle_grey_skull.occupants.each do |person|
  unless person.destination == person.current_floor
    # If they are not check what the closest life is
    closest_lift = castle_grey_skull.closest_lift(person.current_floor)

    # Bring closest lift to person's floor, unless it is already there.
    unless closest_lift.current_floor == person.current_floor
      until closest_lift.current_floor == person.current_floor
        if closest_lift.current_floor > person.current_floor
          closest_lift.go_down
        else
          closest_lift.go_up
        end
      end
    end

    # Person enters the lift
    closest_lift.enter person

    # Person is removed from Castle Grey Skull occupancy
    castle_grey_skull.occupants.delete(person)
  end
  
end

# Each lift with people in it will procede the their destination floors in order,
# and the people will exit the lift. 
castle_grey_skull.lifts.each do |lift|
  if lift.passengers.any?
    lift.passengers.sort! { |a,b| a.destination <=> b.destination }
    lift.passengers.each do |passenger|
      until passenger.destination == lift.current_floor
        if lift.current_floor > passenger.current_floor
          lift.go_down
        else
          lift.go_up
        end
      passengers_exitting = lift.passengers.select do |passenger| 
        passenger.destination == lift.current_floor
      end
      # binding.pry
      end
    end
  end
end



#binding.pry
""



