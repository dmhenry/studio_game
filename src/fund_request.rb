# frozen_string_literal: true

class FundRequest
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
    @projects.each do |_, project|
      s += "\n  #{project}"
    end
    s
  end
end
