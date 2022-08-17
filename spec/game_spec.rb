require "game"


RSpec.describe Game do
  context "construct the class" do
    it "returns the rows and cols" do
    ship_arr = double :Ship
    game = Game.new("harith",3,3,ship_arr)
    expect(game.rows).to eq 3
    expect(game.cols).to eq 3
    end
  end

  describe "#placed_ships" do
  it "stores coordinates for that ship" do
    ship_1 = double :Ship, length: 3
    ship_2 = double :Ship, length: 2
    ship_arr = [ship_1, ship_2]
    game = Game.new("harith",10,10,ship_arr)
    game.place_ship({length: 3, orientation: :vertical,row: 2, col: 2})
    result = game.coords
    expect(result).to eq [[2,2],[2,3],[2,4]]
  #  expect(game.ship_at?(2,2)).to eq true
  #  expect(game.ship_at?(3,5)).to eq false
  end

  it "ensures that the ships placed are within the constrains of the board" do
    # expect it to fail
    ship_1 = double :Ship, length: 3
    ship_2 = double :Ship, length: 2
    ship_arr = [ship_1, ship_2]
    game = Game.new("seb",10,10,ship_arr)
    hash = {length: 3, orientation: :vertical,row: 10, col: 10}
    expect{ game.place_ship(hash)}.to raise_error("Ship is outside boundaries...")
  end


  it "once ship is placed it's then removed from unplaced ships" do
    ship_1 = double :Ship, length: 3
    ship_2 = double :Ship, length: 2
    ship_arr = [ship_1, ship_2]
    game = Game.new("seb",10,10,ship_arr)
    game.place_ship({length: 3, orientation: :vertical,row: 2, col: 2})
    result = game.coords
    expect(result).to eq [[2,2],[2,3],[2,4]]
    #  expect(game.ship_at?(2,2)).to eq true
    #  expect(game.ship_at?(3,5)).to eq false
    end

    it "ensures that the ships placed are within the constrains of the board" do
      # expect it to fail
      ship_1 = double :Ship, length: 3
      ship_2 = double :Ship, length: 2
      ship_arr = [ship_1, ship_2]
      game = Game.new("seb",10,10,ship_arr)
      hash = {length: 3, orientation: :vertical,row: 10, col: 10}
      expect{ game.place_ship(hash)}.to raise_error("Ship is outside boundaries...")
    end


    it "once ship is placed it's then removed from unplaced ships" do
      ship_1 = double :Ship, length: 3
      ship_2 = double :Ship, length: 2
      ship_arr = [ship_1, ship_2]
      game = Game.new("seb",10,10,ship_arr)
      game.place_ship({length: 3, orientation: :vertical,row: 2, col: 2})
      expect(game.unplaced_ships).to eq [ship_2]
    end
  end

  it "returns an error if a ship is placed on another ship" do
    ship_1 = double :ship, length: 3
    ship_2 = double :ship, length: 3
    ship_arr = [ship_1, ship_2]
    game = Game.new("seb",10,10, ship_arr)
    game.place_ship({length: 3, orientation: :vertical ,row: 2, col: 2})
    hash = {length: 3, orientation: :horizontal, row: 3, col: 1}
    expect{game.place_ship(hash)}.to raise_error("Cannot place ship here...")
  end

  describe "#ship_at?" do
    it "checks if there is ship at a given location" do
      ship_1 = double :Ship, length: 3
      ship_2 = double :Ship, length: 2
      ship_arr = [ship_1, ship_2]
      game = Game.new("seb",10,10,ship_arr)
      game.place_ship({length: 3, orientation: :vertical,row: 3, col: 3})
      expect(game.ship_at?(3,3)).to eq true
      expect(game.ship_at?(1,2)).to eq false
    end
  end
end

