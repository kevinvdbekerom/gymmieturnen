require_relative 'gymmie/gymmie'
require_relative 'gymmie/gymmie_database'

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
    "<div class = 'col-md-2 gymmie #{profile} part_#{(gymmie.level + 2) / 3}' data-category='#{profile} part_#{(gymmie.level + 2) / 3}'>
      <p class = 'profile'>#{gymmie.profile}</p>
      <p class = 'level'><h1>#{gymmie.level}</h1></p>
      <span class = 'description'> #{render_gymmie_details(gymmie)}</span>
    </div>"
  end

  def self.render_gymmies(gymmies)
    gymmiesHtml = ""
    gymmies.each do |gymmie|
      gymmiesHtml += render_gymmie(gymmie)
    end
    "<div class = 'grid grid--clickable'>
     #{gymmiesHtml}
    </div>"
  end

  def self.render_gymmie_details(gymmie)
    gymmie_info = GymmieDatabase.find(gymmie.id)
    description = "<p>#{gymmie_info.description}</p>"
    criteria = "<ol>"
    gymmie_info.criteria.each do |requirement|
      criteria << "<li>#{requirement}</li>"
    end
    criteria << "</ol>"
    html =  description << criteria
  end

  # Given a string with spaces, convert to string with underscores
  def self.convert_style_tag(str)
    str.downcase.split.join('_')
  end

end