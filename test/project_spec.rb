# frozen_string_literal: true

require_relative "../src/project"

describe Project do
  before do
    @funding_init = 50
    @funding_goal = 100
    @project = Project.new(name: "name", funding: @funding_init, goal: @funding_goal)
  end

  it "has an initial target funding amount" do
    expect(@project.funding_current).to eq(@funding_init)
  end

  it "has an initial target funding computes the total funding outstanding as the target funding minus the funding amount" do
    expect(@project.remaining_funding).to eq(@funding_goal - @funding_init)
  end

  it "increases funds by the corresponding amount when funds are added" do
    funding_increase = 25
    @project.increase_funding_by(funding_increase)
    expect(@project.funding_current).to eq(@funding_init + funding_increase)
  end

  it "decreases funds by the corresponding amount when funds are removed" do
    funding_decrease = 25
    @project.decrease_funding_by(funding_decrease)
    expect(@project.funding_current).to eq(@funding_init - funding_decrease)
  end

end
