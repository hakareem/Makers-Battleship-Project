require "ship"


RSpec.describe Ship do
 context "constructs the class" do
  it "returns the length of the ship" do
   ship = Ship.new("rain",5)
   expect(ship.length).to eq 5
   expect(ship.ship_name).to eq "rain"
  end
 end 

end