
class Gymmie
  attr_accessor :profile, :level, :completion_date

  def initialize(profile, details)
    @profile = profile
    @level = details['level']
  end
end