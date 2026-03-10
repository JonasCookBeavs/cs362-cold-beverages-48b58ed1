require_relative '../lib/freezer'

describe 'A freezer' do

  it 'has a capacity and temperature' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70) # 70 is default temperature
  end

  it 'initially has full capacity' do
    freezer = Freezer.new(capacity=100)
    expect(freezer.remaining_capacity).to eq(100)
  end

  it 'has less capacity after item is added' do
    freezer = Freezer.new(capacity=100)
    item = Item.new(name='FAKE', volume=50)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(50)
  end

  it 'can set level' do # Not really sure what "level" means in this context, but sure
    freezer = Freezer.new
    freezer.set_level(1)
    expect(freezer.temperature).to eq(60) # 60 = Default temp - level * 10
  end

end
