class Lift
  attr_accessor :current_floor, :name
  attr_reader :passengers, :max_people, :building

  def initialize(building)
    @max_people = 8
    self.current_floor = 0
    @passengers = []
    @building = building
  end

  def overloaded?
    passengers.size >= max_people
  end

  def enter(passenger)
    passengers << passenger unless overloaded?
  end

  def get_out(passenger)
    self.passengers.delete(passenger)
    building.occupants << passenger
  end

  def go_up
    self.current_floor += 1
    passengers.each { |passenger| passenger.current_floor += 1 }
  end

  def go_down
    self.current_floor -= 1
  end

  # distance to floor

  # def travel_to(floor)
  # passengers.each { |p| pasenger.floor = floor}
  # self.floor = floor.to_i

  # instances set only in one place. if something only has a reader it can have an instance var instead of self.name

end
