class Person
  attr_accessor :name, :destination, :current_floor
  
  def initialize(options = {})
    self.name = options[:name]
    self.destination = options[:destination]
    self.current_floor = 0
  end   

end
