require_relative 'gymmie'

class RenderEngine

  def self.render_member(member)
    # Render Member object into html

  end

  def self.render_gymmie(gymmie)
    "<div class = 'col-md-2 gymmie #{convert_style_tag(gymmie.profile)}'>
      <p class = 'profile'>#{gymmie.profile}</p>
      <p class = 'level'>#{gymmie.level}</p>
    </div>"
  end

  def self.render_gymmies(gymmies)
    gymmiesHtml = ""
    gymmies.each do |gymmie|
      gymmiesHtml += render_gymmie(gymmie)
    end
    "<div class = 'row'>
     #{gymmiesHtml}
    </div>"
  end

  # Given a string with spaces, convert to string with underscores
  def self.convert_style_tag(str)
    str.downcase.split.join('_')
  end

end