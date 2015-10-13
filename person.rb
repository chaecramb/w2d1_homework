class Person
  attr_accessor :name, :destination, :current_floor, :in_building
  
  def initialize(options = {})
    self.name = options[:name]
    self.destination = options[:destination]
    self.current_floor = 0
  end   

  def enter_building(building)
    building.occupants << self
    self.in_building = building
  end

  def enter_lift(lift)
    lift.passengers << in_building.occupants.delete(self)
  end

  def exit_lift(lift)
    in_building.occupants << lift.passengers.delete(self)
  end 
end
