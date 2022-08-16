class Game
  attr_accessor :coords

  def initialize(rows,cols,unplaced_ships)
    @cols = cols
    @rows = rows
    @coords = []
    #@ships_placed = [ship_object1 ... ]
    @unplaced_ships = unplaced_ships
  end
  
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
    length = hash.fetch(:length)
    x = hash.fetch(:col)
    y = hash.fetch(:row)
    orientation = hash.fetch(:orientation)

    fail "Cannot place ship here..." unless check_overlap(x, y, length, orientation)
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

  # def place_shot(x,y)
  #   if ship_at?(x,y)
  #     @coords[x,y] = "X"
  #     #another instatiated array showing where player has been hit
  #     #push coords there

  #     #player loses when hitarray.length == @coords
  #   end
  # end


  def check_overlap(x, y, length, orientation)

    return false if @coords.any?{|coord| coord == [x, y]}
    if orientation == :vertical
      length-1.times do
        y += 1
        return false if @coords.any?{|coord| coord == [x, y]} 
      end

    elsif orientation == :horizontal
      length-1.times do
        x += 1
        return false if @coords.any?{|coord| coord == [x, y]} 
      end

    end
    return true
  end
end

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
# So that I know when to finish playing
# I would like to know when I have won or lost

# As a player
# So that I can consider my next shot
# I would like to be able to see my hits and misses so far

## BONUS AT THE END OF TASKS.

# As a player
# So that I can refine my strategy
# I would like to know when I have sunk an opponent's ship