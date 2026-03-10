require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity and initial capacity' do
    water_reservoir = WaterReservoir.new
    expect(water_reservoir.capacity).to eq(10)
    expect(water_reservoir.current_water_volume).to eq(0)
  end

  it 'is initially empty' do
    water_reservoir = WaterReservoir.new
    expect(water_reservoir).to be_empty
  end

  it 'is not empty after being filled' do
    water_reservoir = WaterReservoir.new
    water_reservoir.fill
    expect(water_reservoir).to_not be_empty
  end

  it 'is empty after draining' do
    water_reservoir = WaterReservoir.new(capacity=10, initial_water_volume=10)
    water_reservoir.drain(10)
    expect(water_reservoir).to be_empty
  end

end