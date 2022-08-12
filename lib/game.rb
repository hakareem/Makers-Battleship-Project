class Game
  attr_accessor :coords

  def initialize(rows,cols,unplaced_ships)
    @cols = cols
    @rows = rows
    @coords = []
    @unplaced_ships = unplaced_ships
  end
  

  #initalize
    # rows && cols
    # [[x,y], [x,y]...] << all the ship coordinatees on the board

  def unplaced_ships
    @unplaced_ships
  end

  def rows
    @rows
  end

  def cols
    @cols
  end

  def place_ship(hash)

    # check if ship is in unplaced ship array //
      ## check_unplaced
    # remove ship from unplaced ships //
      ## remove_ship

    length = hash.fetch(:length)
    x = hash.fetch(:row)
    y = hash.fetch(:col)
    orientation = hash.fetch(:orientation)

    check_unplaced(length) ? remove_ship(length) : "Ship doesn't exist..."

    if orientation == :vertical

      length.times do 
        @coords << [x, y]
        y += 1
      end

    elsif orientation == :horizontal 

      length-1.time do
        @coords << [x, y]
        x += 1
      end
    end

  end

  def ship_at?(x,y,arr)
    arr.any?{|coords| coords == [x,y]}
  end


  def format_board
    return (1..@game.rows).map do |y|
      (1..@game.cols).map do |x|
        next "S" if @game.ship_at?(x, y)
        next "."
      end.join
    end.join("\n")
  end

  private

  def check_unplaced(length)

    @unplaced_ships.any?{|ship| ship.length == length}

  end

  def remove_ship(length)

    @unplaced_ships.delete_at(unplaced_ships.find_index{|ship| ship.length == length})

  end

end

# As a player
# So that I can prepare for the game
# I would like to place a ship in a board location

# As a player
# So that I can play a more interesting game
# I would like to have a range of ship sizes to choose from

# As a player
# So the game is more fun to play
# I would like a nice command line interface that lets me enter ship positions and
# shots using commands (rather than using IRB to interact with objects)

# As a player
# So that I can create a layout of ships to outwit my opponent
# I would like to be able to choose the directions my ships face in

# As a player
# So that I can have a coherent game
# I would like ships to be constrained to be on the board
