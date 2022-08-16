require "ship"


RSpec.describe Ship do
 context "constructs the class" do
  it "returns the length of the ship" do
   ship = Ship.new("destroyer",5)
   expect(ship.length).to eq 5
   expect(ship.ship_name).to eq "destroyer"
  end

  it "fails if ship is given an empty name" do
   expect{Ship.new("", 5)}.to raise_error "Please setup ship with a valid name and length"
  end

  it "fails if ship is given an invalid length" do
   expect{Ship.new("battleship", 3.5)}.to raise_error "Please setup ship with a valid name and length"
   expect{Ship.new("battleship", "3")}.to raise_error "Please setup ship with a valid name and length"
  end
 end 
end