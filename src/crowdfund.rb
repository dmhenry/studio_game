# frozen_string_literal: true

class Project
  def initialize(name, funding, goal)
    @name = name
    @funding_current = funding
    @funding_goal = goal.freeze
  end

  def increase_by(funding = 0)
    @funding_current += funding
    "Project #{@name} has gained \$#{funding}!"
  end

  def decrease_by(funding = 0)
    @funding_current -= funding
    "Project #{@name} has lost \$#{funding}!"
  end

  def to_s
    "Project #{@name} has \$#{@funding_current} in funding towards a goal of \$#{@funding_goal}."
  end
end

proj_lmn = Project.new("lmn", 500, 3000)
proj_xyz = Project.new("xyz", 25, 75)

puts proj_lmn
puts proj_xyz
puts proj_lmn.decrease_by(15)
puts proj_xyz.increase_by(25)
puts proj_lmn
puts proj_xyz
