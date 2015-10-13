class Person
  attr_accessor :name, :destination, :current_floor
  
  def initialize(options = {})
    self.name = options[:name]
    self.destination = options[:destination]
    self.current_floor = 0
  end   

  # def enter_lift
  # end

end

=begin

Person needs to know either what lift they're in, or what building they're in in order
to implement an enter_lift method in the Person class?

=end