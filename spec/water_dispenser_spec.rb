require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  let (:vessel)    { vessel = Vessel.new(volume=100) }
  let (:reservoir) { reservoir = WaterReservoir.new(vessel.volume, vessel.volume) }
  let (:dispenser) { water_dispenser = WaterDispenser.new(reservoir) }
  
  it 'has a reservoir' do
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses from reservoir' do
    dispenser.dispense(vessel)
    expect(reservoir).to be_empty
  end

  it 'vessel is not empty once dispensed into' do
    dispenser.dispense(vessel)
    expect(vessel).to_not be_empty
  end
  
  it 'fills vessel slightly when volume is greater than reservoir capcity' do
    vessel = Vessel.new(volume=1000)
    dispenser.dispense(vessel)
    expect(vessel.current_volume).to eq(100)
  end

  it 'reservoir does not go below zero current water volume' do
    vessel = Vessel.new(volume=1000)
    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
