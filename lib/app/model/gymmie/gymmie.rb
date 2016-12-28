
class Gymmie
  attr_accessor :profile, :level, :completion_date

  def initialize(profile, details)
    @profile = profile
    @level = details['level']
  end

  def id
    @profile.downcase << @level.to_s
  end

end