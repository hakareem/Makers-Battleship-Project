class UserInterface
  def initialize(io, player1, player2)
    @io = io
    @player1 = player1
    @player2 = player2
  end
  
  def intro
    show "Welcome to the game!"
    show "Set up your ships first."
  end

  def place_ship_on_board(player)
    show "You have these ships remaining: #{ships_unplaced_message(player)}"
    prompt_for_ship_placement(player)
    show "This is your board now:"
    show format_board(player)
  end

  def setup_player(player)
    place_ship_on_board(player)
  end

  def setup_board(player1, player2)
    setup_player(player1)
    setup_player(player2)
  end
    

  def prompt_for_player(player)
    show "This is your board now:"
    show format_board(player)
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    if player.ship_at?(ship_row.to_i, ship_col.to_i)
      show "Hit!"
    end
    player.place_shot(ship_row.to_i,ship_col.to_i)
  end

  def play(player1, player2)
    prompt_for_player(player1)
  end

  def run
    intro
    setup_player(@player1)
    setup_player(@player2)
    play(@player1, @player2)
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def ships_unplaced_message(player)
    return player.unplaced_ships.map do |ship|
      "#{ship.length}"
    end.join(", ")
  end

  def prompt_for_ship_placement(player)
    ship_length = prompt "Which do you wish to place?" 
    # remove the ship from unplaced ships
    ship_orientation = prompt "Vertical or horizontal? [vh]"
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    # if ship placement is invalid prompt player again
    # show "Invalid Input, Try Again"
    
    show "OK."
    player.place_ship(
      length: ship_length.to_i,
      orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
      row: ship_row.to_i,
      col: ship_col.to_i
    )
  end

  def format_board(player)
    return (1..player.rows).map do |y|
      (1..player.cols).map do |x|
        next "S" if player.ship_at?(x, y)
        next "."
      end.join
    end.join("\n")
  end
end