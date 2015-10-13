class Lift
  attr_accessor :current_floor, :name, :building
  attr_reader :passengers, :max_people

  def initialize(building)
    @max_people = 8
    self.current_floor = 0
    @passengers = []
    @building = building
  end

  def overloaded?
    passengers.size >= max_people
  end

  def go_up
    unless current_floor == building.floors.to_i 
      self.current_floor += 1 
      passengers.each { |passenger| passenger.current_floor += 1 }
    end
  end

  def go_down
    self.current_floor -= 1
    passengers.each { |passenger| passenger.current_floor -= 1 }
  end

end
