# frozen_string_literal: true

class Crowdfund
  attr_reader :name, :projects

  def initialize(name)
    @name = name.downcase.capitalize
    @projects = {}
  end

  def add(project:)
    @projects[project.name.downcase] = project
  end

  def increase_funding_by(name:, amount: 0)
    @projects[name.downcase].increase_funding_by(amount)
  end

  def decrease_funding_by(name:, amount: 0)
    @projects[name.downcase].decrease_funding_by(amount)
  end

  def to_s
    s = "Project '#{@name}' (#{@projects.length}):"
    @projects.each do |name, project|
      s += "\n  #{project.to_s}"
    end
    s
  end
end

class Project
  attr_accessor :name
  attr_reader   :funding_current, :funding_goal

  def initialize(name:, funding: 0, goal:)
    @name = name
    @funding_current = funding
    @funding_goal = goal.freeze
  end

  def increase_funding_by(funding)
    @funding_current += funding
    "Project #{@name} has gained \$#{funding}!"
  end

  def decrease_funding_by(funding)
    @funding_current -= funding
    "Project #{@name} has lost \$#{funding}!"
  end

  def remaining_funding
    needed = @funding_goal - @funding_current
    if (needed > 0)
      needed
    else
      0
    end
  end

  def goal_met?
    remaining_funding == 0
  end

  def to_s
    "Project #{@name} has \$#{@funding_current} in funding towards a goal of \$#{@funding_goal}.\
 \$#{remaining_funding} are still needed!"
  end
end

crowdfund = Crowdfund.new("default")
abc = Project.new(name: "abc", funding: 500, goal: 3000)
lmn = Project.new(name: "lmn", goal: 1200)
xyz = Project.new(name: "xyz", funding: 100, goal: 500)

crowdfund.add(project: abc) 
crowdfund.add(project: lmn) 
crowdfund.add(project: xyz) 

puts crowdfund

crowdfund.decrease_funding_by(name: "abc", amount: 200)
crowdfund.increase_funding_by(name: "lmn", amount: 300)
crowdfund.increase_funding_by(name: "xyz", amount: 500)

puts crowdfund
