$LOAD_PATH << "lib"
require "game"
require "ship"
require "user_interface"

class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end

# io = TerminalIO.new
# game = Game.new
# user_interface = UserInterface.new(io, game)
# user_interface.run


io = TerminalIO.new
list_of_ship = []
list_of_ship << Ship.new("carrier",5)
list_of_ship << Ship.new("cursier",4)
list_of_ship << Ship.new("destroyer",3)
list_of_ship << Ship.new("battleship",3)
game1 = Game.new(10,10,list_of_ship)
game2 = Game.new(10,10,list_of_ship)
user_interface = UserInterface.new(io, game1, game2)
user_interface.run