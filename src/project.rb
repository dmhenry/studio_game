# frozen_string_literal: true

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
