class GymmieDatabase
  attr_accessor :gymmies

  def initialize
    @gymmies = Array.new()
    gymmie_example = GymmieInfo.new('arabier1',
                                    ['benen bij elkaar', 'voeten raken bank niet', 'handen plat op de bank'],
                                    'Door middel van wendsprongen over een bank gaan.')

  end

  def self.gymmie_database
    gymmies_database = GymmieDatabase.new()
    gymmie_example = GymmieInfo.new('arabier1',
                                    ['benen bij elkaar', 'voeten raken bank niet', 'handen plat op de bank'],
                                    'Door middel van wendsprongen over een bank gaan.')
    gymmies_database.add_gymmie(gymmie_example)
    gymmies_database
  end

  def add_gymmie(gymmie)
    @gymmies << gymmie
    p @gymmies
  end

  def self.find(id)
    db = self.gymmie_database
    result = db.gymmies.select {|gymmie| gymmie.id.eql?(id)}
    p result
    # dirty hack to return single element
     if (result.size > 0) then result[0] else GymmieInfo.new("no_info_available", [], "") end
  end
end