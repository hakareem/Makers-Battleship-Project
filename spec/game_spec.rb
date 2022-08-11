require "game"


RSpec.describe Game do
 context "construct the class" do
  it "returns the rows and cols" do
   ship_arr = double :Ship
   game = Game.new(3,3,ship_arr)
   expect(game.rows).to eq 3
   expect(game.cols).to eq 3
  end
 end

 describe "#placed_ships" do
  it "stores coordinates for that ship" do
   ship_arr = double :Ship
   game = Game.new(10,10,ship_arr)
   hash =  {length: 3, orientation: :vertical,row: 0, col: 0}
   game.place_ship(hash)
   arr = game.coords
   expect(game.ship_at?(0,0,arr)).to eq true
   expect(game.ship_at?(0,1,arr)).to eq true
   expect(game.ship_at?(0,2,arr)).to eq true
  end


  it "once ship is placed it's then removed from unplaced ships" do
    ship_1 = double :Ship, length: 3
    ship_2 = double :Ship, length: 2
    ship_arr = [ship_1, ship_2]
    game = Game.new(10,10,ship_arr)
    hash =  {length: 3, orientation: :vertical,row: 0, col: 0}
    expect(check_unplaced).to receive()
    game.place_ship(hash)
    expect(game.unplaced_ships).to eq [ship_1 , ship_2]
  end
 end

 describe "#ship_at?" do
  it "checks if there is pre existing ship at a given location" do
   coords_arr = [[1,2]]
   ship_arr = double :Ship
   game = Game.new(10,10,ship_arr)
   coords = double :coords
   expect(game.ship_at?(1,2,coords_arr)).to eq true
  end
 end
end

# {      length: ship_length.to_i,
# orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
# row: ship_row.to_i,
# col: ship_col.to_i
# }