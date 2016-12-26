require_relative 'gymmie/gymmie'

class Member
  attr_accessor :first_name, :last_name, :gymmies

  def initialize(member)
    @first_name = member['first_name']
    @last_name = member['last_name']
    @gymmies = load_gymmies(member['gymmies'])
  end

  def load_gymmies(gymmies)
    @gymmies = gymmies.collect {|profile|
      profile['levels'].collect {|gymmie| Gymmie.new(profile['profile'], gymmie)}}
  end
end