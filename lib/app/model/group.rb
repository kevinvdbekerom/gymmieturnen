require_relative 'member'

class Group
  attr_accessor :members, :name

  def initialize(group)
    @name = group['name']
    @members = load_members(group['members'])
  end

  def load_members(members)
    members.collect {|member| Member.new(member)}
  end

  def add_member(member)
    @members << Member.new(member)
  end

  def find_member(first_name, last_name)
    @members.collect {|member| member.first_name.eq?(first_name) &&
                                 member.last_name.eq?(last_name)}
  end


end