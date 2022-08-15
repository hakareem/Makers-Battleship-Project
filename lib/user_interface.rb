class UserInterface
  def initialize(io, game1, game2)
    @io = io
    @game1 = game1
    @game2 = game2
  end
  
  def intro
    show "Welcome to the game!"
    show "Set up your ships first."
  end

  def place_ship_on_board(game)
    show "You have these ships remaining: #{ships_unplaced_message(game)}"
    prompt_for_ship_placement(game)
    show "This is your board now:"
    show format_board(game)
  end

  def setup_player(game)
    place_ship_on_board(game)
  end

  def setup_board(game1, game2)
    setup_player(game1)
    setup_player(game2)
  end
    

  def prompt_for_player(game)
    show "This is your board now:"
    show format_board(game)
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    if game.ship_at?(ship_row.to_i, ship_col.to_i)
      show "Hit!"
    end
    game.place_shot(ship_row.to_i,ship_col.to_i)
  end

  def play(game1, game2)
    prompt_for_player(game1)
  end

  def run
    intro
    setup_player(@game1)
    setup_player(@game2)
    play(@game1, @game2)
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def ships_unplaced_message(game)
    return game.unplaced_ships.map do |ship|
      "#{ship.length}"
    end.join(", ")
  end

  def prompt_for_ship_placement(game)
    ship_length = prompt "Which do you wish to place?" 
    # remove the ship from unplaced ships
    ship_orientation = prompt "Vertical or horizontal? [vh]"
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    show "OK."
    game.place_ship(
      length: ship_length.to_i,
      orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
      row: ship_row.to_i,
      col: ship_col.to_i
    )
  end

  def format_board(game)
    return (1..game.rows).map do |y|
      (1..game.cols).map do |x|
        next "S" if game.ship_at?(x, y)
        next "."
      end.join
    end.join("\n")
  end

  # def format_board(game)
  #   game.player_state.map(&:join).join("\n")
  # end
end
