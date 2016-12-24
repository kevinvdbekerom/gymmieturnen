
# Static list of all possible gymmies one can obtain

class Gymmies
  attr_accessor :gymmies_catalog

  def initialize
    @gymmies_catalog = Array.new()
    fill_catalog
  end

  def fill_catalog
    profiles = ['Arabier', 'Salto vo', 'Salto ao', 'Overslag']
    profiles.each do |profile|
      (1..9).each do |level|
        @gymmies_catalog << Gymmie.new(profile, {"level" => level})
      end
    end

  end

end