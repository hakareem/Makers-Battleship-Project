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

io = TerminalIO.new
list_of_ship = []
list_of_ship << Ship.new("carrier",5)
list_of_ship << Ship.new("cursier",4)
list_of_ship << Ship.new("destroyer",3)
list_of_ship << Ship.new("battleship",3)
player1 = Game.new(10,10,list_of_ship)
player2 = Game.new(10,10,list_of_ship)
user_interface = UserInterface.new(io, player1, player2)
user_interface.run