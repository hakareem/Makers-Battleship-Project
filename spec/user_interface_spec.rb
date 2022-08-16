require "user_interface"

RSpec.describe UserInterface do
  describe "ship setup scenario" do
    it "introduces" do
      io = double(:io)
      player1 = double(:game)
      player2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, player1, player2)
      expect(io).to receive(:puts).and_return("Welcome to the game!")
      expect(io).to receive(:puts).and_return("Set up your ships first.")
      interface.intro
    end 
  end

    it "allows the user to setup single ship" do
      io = double(:io)
      player1 = double(:game, rows: 10, cols: 10)
      player2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, player1, player2)
      expect(player1).to receive(:unplaced_ships).and_return([
        double(:ship, length: 2),
        double(:ship, length: 5),
      ])
      expect(io).to receive(:puts).with("You have these ships remaining: 2, 5")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(player1).to receive(:check_placement).
      with("2",'3',"2","v")
      .and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(player1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(player1).to receive(:ship_at?).and_return(false)
      allow(player1).to receive(:ship_at?).with(2, 3).and_return(true)
      allow(player1).to receive(:ship_at?).with(2, 4).and_return(true)
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      interface.place_ship_on_board(player1)
      end

    describe "#intro method" do
      it "creates two boards and decides who goes first" do
      
      end
    end
end
