require "ship"
require "game"
require "user_interface"
require_relative '../run.rb'


RSpec.describe "integration" do
 it "returns unplaced ships" do
  # The 5 ships are:  Carrier (occupies 5 spaces), Battleship (4), Cruiser (3), Submarine (3), and Destroyer (2).  
  
  ship_1 = Ship.new("Carrier",5)
  ship_2 = Ship.new("Battleship",4)
  ship_3 = Ship.new("Cruiser",3)
  ship_4 = Ship.new("Submarine",3)
  ship_5 = Ship.new("Destroyer",2)
  arr = [ship_1, ship_2, ship_3, ship_4, ship_5]
  game = Game.new(10,10, arr)
  expect(game.unplaced_ships).to eq [ship_1, ship_2, ship_3, ship_4, ship_5]
 end

 describe "#intro method" do
  it "creates two boards and decides who goes first" do
    ship_1 = Ship.new("Carrier",5)
    ship_2 = Ship.new("Battleship",4)
    ship_3 = Ship.new("Cruiser",3)
    ship_4 = Ship.new("Submarine",3)
    ship_5 = Ship.new("Destroyer",2)
    arr = [ship_1, ship_2, ship_3, ship_4, ship_5]
    player1 = Game.new(10,10, arr)
    player2 = Game.new(10,10, arr)
    interface = UserInterface.new(io, player1, player2)
    
  end
 end
end