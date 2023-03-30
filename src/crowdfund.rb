# frozen_string_literal: true

class Project
  def initialize(name, funding, target)
    @name = name
    @funding = funding
    @target = target
  end

  def increaseBy(gain = 0)
    @funding += gain
    "Project #{@name} has gained \$#{gain}!"
  end

  def decreaseBy(loss = 0)
    @funding -= loss
    "Project #{@name} has lost \$#{loss}!"
  end

  def to_s
    "Project #{@name} has \$#{@funding} in funding towards a goal of \$#{@target}."
  end
end

proj_lmn = Project.new("lmn", 500, 3000)
proj_xyz = Project.new("xyz", 25, 75)

puts proj_lmn
puts proj_xyz
puts proj_lmn.decreaseBy(15)
puts proj_xyz.increaseBy(25)
puts proj_lmn
puts proj_xyz
