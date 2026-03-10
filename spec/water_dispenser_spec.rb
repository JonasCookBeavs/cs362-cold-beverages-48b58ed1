require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(reservoir)
    expect(water_dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses from reservoir' do
    vessel = Vessel.new(volume=100)
    reservoir = WaterReservoir.new(vessel.volume, vessel.volume)
    water_dispenser = WaterDispenser.new(reservoir)
    
    water_dispenser.dispense(vessel)
    expect(reservoir).to be_empty
  end
  
end
