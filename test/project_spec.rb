# frozen_string_literal: true

require_relative "../src/project"

describe Project do
  before do
    stdout = StringIO.new
    @funding_current = 500
    @funding_goal = 3000
    @abc = Project.new(name: "abc", funding: @funding_current, goal: @funding_goal)
  end

  it "has remaining funding equal to goal less initial funding" do
    expect(@abc.remaining_funding).to eq(@abc.funding_goal - @abc.funding_current)
  end

  it "has current funding equal inital funding plus increase" do
    @abc.increase_funding_by(500)
    expect(@abc.remaining_funding).to eq(@abc.funding_goal - @abc.funding_current)
  end

  it "has current funding equal inital funding minus decrease" do
    @abc.decrease_funding_by(500)
    expect(@abc.remaining_funding).to eq(@abc.funding_goal - @abc.funding_current)
  end
end
