require_relative '../lib/chiller'

describe 'A chiller' do
  
  it 'has a capacity and temperature' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70) # 70 is default temperature
  end

  it 'initially has full capacity' do
    chiller = Chiller.new(capacity=100)
    expect(chiller.remaining_capacity).to eq(100)
  end

  it 'has less capacity after item is added' do
    chiller = Chiller.new(capacity=100)
    item = Item.new(name='FAKE', volume=50)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(50)
  end

  it 'can set level' do # Not really sure what "level" means in this context, but sure
    chiller = Chiller.new
    chiller.set_level(1)
    expect(chiller.temperature).to eq(65) # 65 = Default temp - level * 10
  end

end
