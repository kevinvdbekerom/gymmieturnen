require_relative 'gymmie/gymmie'

class RenderEngine

  def self.render_group(group)
    "
    <tr>
    <td>#{group.name} </td>
    <td>#{group.members.size}</td>
    <td>
      <a href='/groups/#{group.name}'>Bekijk leden</a> |
      <a href='/groups/new'>Nieuwe groep</a> |
      <a href='/groups/#{group.name}/new'>Nieuw lid</a>
    </td>
    </tr>
    "
  end

  def self.render_groups(groups)
    html = "<table class = 'table table-bordered'
            <tr><th>Naam</th><th>Aantal leden</th><th>Acties</th></tr>"
    groups.each do |group|
      html << render_group(group)
    end
    html << "</table>"
  end

  def self.render_member(member)
    "
    <tr>
    <td>#{member.first_name} </td>
    <td>#{member.last_name}</td>
    </tr>
    "
  end

  def self.render_members(members)
    html = "<table class = 'table table-bordered'
            <tr><th>Voornaam</th><th>Achternaam</th><th>Acties</th></tr>"
    members.each do |member|
      html << render_member(member)
    end
    html << "</table>"
  end

  def self.render_gymmie(gymmie)
    profile = convert_style_tag(gymmie.profile)
    link = profile + gymmie.level.to_s
    "<div class = 'col-md-2 gymmie #{profile}' data-category='#{profile}' >
      <p class = 'profile'>#{gymmie.profile}</p>
      <p class = 'level'>#{gymmie.level}</p>
      <p><a href='/gymmies/#{link}' class='btn-lg btn-default' role='button'>Details</a></p>
    </div>"
  end

  def self.render_gymmies(gymmies)
    gymmiesHtml = ""
    gymmies.each do |gymmie|
      gymmiesHtml += render_gymmie(gymmie)
    end
    "<div class = 'grid'>
     #{gymmiesHtml}
    </div>"
  end

  def self.render_gymmie_details(gymmie_info)
    name = "<p><h2>#{gymmie_info.id}</h2><p>"
    description = "<p>#{gymmie_info.description}<p>"
    criteria = ""
    gymmie_info.criteria.each do |requirement|
      criteria << "<p>#{requirement}<p>"
    end
    html = name << description << criteria
  end

  # Given a string with spaces, convert to string with underscores
  def self.convert_style_tag(str)
    str.downcase.split.join('_')
  end

end