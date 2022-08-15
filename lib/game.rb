class Game
  attr_accessor :coords

  def initialize(rows,cols,unplaced_ships)
    @cols = cols
    @rows = rows
    @coords = []
    @unplaced_ships = unplaced_ships
    # @player_state = (1..@rows).map do |y|
    #   (1..@cols).map do |x|
    #     "."
    #   end
    # end
    #   @opponent_state = (1..@rows).map do |y|
    #   (1..@cols).map do |x|
    #     "."
    #   end
    # end
  end
  
  def unplaced_ships
    @unplaced_ships
  end

  def player_state
    @player_state
  end

  def rows
    @rows
  end

  def cols
    @cols
  end

  def place_ship(hash)
    length = hash.fetch(:length)
    x = hash.fetch(:row)
    y = hash.fetch(:col)
    orientation = hash.fetch(:orientation)

    fail "Ship is outside boundaries..." unless check_constraint(x,y,length,orientation)

    check_unplaced(length) ? remove_ship(length) : "Ship doesn't exist..."

    if orientation == :vertical

      length.times do 
        @coords << [x, y]
        y += 1
      end

    elsif orientation == :horizontal 

      length.times do
        @coords << [x, y]
        x += 1
      end
    end

  end

  def ship_at?(x,y)
    @coords.any?{|coords| coords == [x,y]}
  end

  def place_shot(x,y)
    if ship_at?(x,y)
      @coords[x,y] = "X"
    end
  end

  private

  def check_unplaced(length)
    @unplaced_ships.any?{|ship| ship.length == length}
  end

  def remove_ship(length)
    @unplaced_ships.delete_at(unplaced_ships.find_index{|ship| ship.length == length})
  end

  def check_constraint(x, y, length, orientation)

    x < 0 || y < 0 ? false : true

    if orientation == :vertical

      length.times do 
        return false if y > 10
        y += 1
      end

    elsif orientation == :horizontal 

      length.times do
        return false if x > 10
        x += 1
      end
    end
    return true
  end
end



# As a player
# So that I can have a coherent game
# I would like ships to be constrained not to overlap

# As a player
# So the game is more fun to play
# I would like a nice command line interface that lets me enter ship positions and
# shots using commands (rather than using IRB to interact with objects)

# As a player
# So that I can play against a human opponent
# I would like to play a two-player game

# As a player
# So that I can win the game
# I would like to be able to fire at my opponent's board

# As a player
# So that I can refine my strategy
# I would like to know when I have sunk an opponent's ship

# As a player
# So that I know when to finish playing
# I would like to know when I have won or lost

# As a player
# So that I can consider my next shot
# I would like to be able to see my hits and misses so far
