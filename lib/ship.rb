class Ship
 attr_reader :ship_name, :length
 
 def initialize(ship_name, length)
  @length = length
  @ship_name = ship_name
 end
end