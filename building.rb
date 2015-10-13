class Building
  attr_accessor :name, :floors, :occupants
  attr_reader :lifts

  def initialize(options = {})
    self.floors = options.fetch(:floors, 2)
    self.name = options[:name]
    @lifts = options[:lifts].times.map { Lift.new(self) }
    self.occupants = []
  end

  def closest_lift(floor)
    lift_positions = lifts.map do |lift|
      lift.current_floor
    end
    closest_lift = lifts[lift_positions.index(lift_positions.min)]
  end
  
end
