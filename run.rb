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
list_of_ship << Ship.new("carrier",2)
player1 = Game.new("Seb",10,10,list_of_ship.clone)
player2 = Game.new("Harith",10,10,list_of_ship.clone)
user_interface = UserInterface.new(io, player1, player2)
user_interface.run