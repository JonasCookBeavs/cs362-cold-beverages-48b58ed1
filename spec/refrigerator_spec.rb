require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  
  let(:chiller)          { Chiller.new(capacity=100) }
  let(:freezer)          { Freezer.new(capacity=100) }
  let(:reservoir)        { WaterReservoir.new }
  let(:dispenser)        { WaterDispenser.new(reservoir) }
  let(:refrigerator)     { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'has various attributes' do
    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.water_dispenser).to eq(dispenser)
    expect(refrigerator.water_reservoir).to eq(reservoir)
  end

  it 'has total capacity equal to chiller and freezer capacity' do
    expect(refrigerator.total_capacity).to eq(200) # 100 + 100
  end

  it 'initially has full remaining capacity' do
    expect(refrigerator.remaining_capacity).to eq(refrigerator.total_capacity)
  end

  it 'can set chiller level' do
    refrigerator.set_chiller_level(1)
    expect(chiller.temperature).to eq(65)
  end

  it 'can set freezer level' do
    refrigerator.set_freezer_level(1)
    expect(freezer.temperature).to eq(60)
  end

  it 'can add item to chiller' do
    item = Item.new(name="TEST", volume=50)
    refrigerator.chill(item)
    expect(chiller.remaining_capacity).to eq(50)
  end

  it 'can add item to freezer' do
    item = Item.new(name="TEST", volume=50)
    refrigerator.freeze(item)
    expect(freezer.remaining_capacity).to eq(50)
  end

end
