class GymmieDatabase
  attr_accessor :gymmies

  def initialize
    @gymmies = Array.new()
  end

  def add_gymmie(gymmie)
    @gymmies << gymmie
    p @gymmies
  end

  def find(id)
    result = @gymmies.select {|gymmie| gymmie.id.eql?(id)}
    p result
    result[0] # dirty hack to return single element
  end
end