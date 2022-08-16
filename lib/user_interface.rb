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
    while true
      break if player.unplaced_ships.empty?
      place_ship_on_board(player)
    end
  end

  def setup_board(player1, player2)
    setup_player(player1)
    setup_player(player2)
  end
    

  def prompt_for_player(shooting_player, opp_player)
    show "These are your hits and misses so far:"
    show format_shots(shooting_player)
    # show shooting player's hits and misses so far
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    if opp_player.ship_at?(ship_row.to_i, ship_col.to_i)
      show "Hit!"
      shooting_player.hit_array << [ship_col.to_i, ship_row.to_i] 
    else
      show "Miss!"
      shooting_player.miss_array << [ship_col.to_i, ship_row.to_i]
    end
  end

  # def play(player1, player2)
  #   prompt_for_player(player1)
  # end

  def run
    intro
    setup_player(@player1)
    setup_player(@player2)
    p @player2.coords
    shooter = @player1
    opposition = @player2

    while true do
      prompt_for_player(shooter, opposition)
      break if check_win(shooter)
      shooter, opposition = opposition, shooter
    end
    show "#{shooter} has won the game!"
  end

  def check_win(player)

    #cheap
    player.coords.length == player.hit_array.length

  end


  def format_shots(player)
  return (1..player.rows).map do |y|
    (1..player.cols).map do |x|
      if player.hit_array.any?{|coord| coord == [x,y]}
        "X"
      elsif player.miss_array.any?{|coord| coord == [x,y]}
        "O"
      else
        "."
      end
    end.join
  end.join("\n")
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


    while true do
      length = prompt "Which do you wish to place?"
      # remove the ship from unplaced ships 
      orientation = prompt "Vertical or horizontal? [vh]"
      row = prompt "Which row?"
      col = prompt "Which column?"

      #if player.check_placement(x, y, length, orientation) is true break the while loop
      if player.check_placement(col, row, length, orientation)
        break
      else
        show "Invalid Input, Try Again"
      end
      # if ship placement is invalid prompt player again
      # show "Invalid Input, Try Again"
    end

      show "OK."
      player.place_ship(
        length: length.to_i,
        orientation: {"v" => :vertical, "h" => :horizontal}.fetch(orientation),
        row: row.to_i,
        col: col.to_i
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