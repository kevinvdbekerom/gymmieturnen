require_relative 'group'

class Manager
  attr_accessor :groups, :club_name

  def initialize(club_name)
    @club_name = club_name
    @groups = Array.new()
    load_groups(File.expand_path(File.join(__FILE__, '..', '..', '..','..','database')))
  end

  def add_group(group_name)
    hash = {"name" => group_name,
            "members" => []}
    p group_name
    p contains_group(group_name)
    @groups << Group.new(hash) unless contains_group(group_name)
    File.open(File.expand_path(File.join(__FILE__, '..', '..', '..','..',"database/#{group_name}.json")), 'w') do |f|
      f.write(hash.to_json)
    end
  end

  def move_member(from_group, to_group, member)

  end

  def load_groups(folder)
    Dir["#{folder}/*.json"].each do |file|
      json = File.read(file)
      data = JSON.parse(json)
      @groups << Group.new(data)
    end
  end

  def contains_group(group_name)
    @groups.each do |group|
      return true if group_name.eql?(group.name)
    end
    false
  end

  def group(name)
    @groups.find {|group| group.name.eql?(name)}
  end

end