require_relative 'group'

class Manager
  attr_accessor :groups, :club_name

  def initialize(club_name)
    @club_name = club_name
    @groups = Array.new()
  end

  def add_group(hash)
    @groups << Group.new(hash)
  end

  def move_member(from_group, to_group, member)

  end

end