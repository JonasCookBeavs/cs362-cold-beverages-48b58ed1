class Item
  attr_reader :name, :volume

  def initialize(name='FAKE', volume=1)
    @name = name
    @volume = volume
  end

end
