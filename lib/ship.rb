class Ship
 attr_reader :ship_name, :length
 
 def initialize(ship_name, length)
  fail "Please setup ship with a valid name and length" if ship_name.empty? || !length.is_a?(Integer)
  @length = length
  @ship_name = ship_name
 end
end