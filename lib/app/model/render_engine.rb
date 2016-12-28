require_relative 'gymmie/gymmie'
require_relative 'gymmie/gymmie_database'

class RenderEngine



  def self.render_group(group)
    "
    <tr>
    <td>#{group.name} </td>
    <td>#{group.members.size}</td>
    <td>
      <button type='button' class='btn btn-primary toggler' data-prod-cat='#{group.name}'>
      Leden <span class='badge'>#{group.members.size}</span>
      <span class = 'glyphicon glyphicon-triangle-bottom'>
      </button>

      <a href = '/groups/addmember/#{group.name}' class = 'btn btn-primary'>Nieuw lid</a>
    </td>
    </tr>
   #{render_members(group.members, group.name)}
    "
  end

  def self.render_groups(groups)
    html = "<table class = 'table table-bordered table-hover'
            <tr><th>Naam</th><th>Aantal leden</th><th>Acties</th></tr>"
    groups.each do |group|
      html << render_group(group)
    end
    html << "</table>"
  end

  def self.render_member(member, group_name)
    "
    <tr class = 'cat_#{group_name}' style='display:none;'>
    <td>#{member.first_name}</td>
    <td>#{member.last_name}</td>
    <td>
      <a href = '/members/#{member.first_name}_#{member.last_name}' class = 'btn btn-primary'>Details </a>
      <a href = '/members/#{member.first_name}_#{member.last_name}' class = 'btn btn-primary'>Overzetten</a>
    </td>
    </tr>
    "
  end

  def self.render_members(members, group_name)
    html = "<tr class = 'cat_#{group_name}' style='display:none;'>"
    html << "<td>Voornaam</td><td>Achternaam</td><td>Acties</td>"
    # html = "<table class = 'table table-bordered'
    #         <tr><th>Voornaam</th><th>Achternaam</th><th>Acties</th></tr>"
    members.each do |member|
      html << render_member(member, group_name)
    end
    html << "</tr>"
    # html << "</table>"
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