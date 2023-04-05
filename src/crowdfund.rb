# frozen_string_literal: true

require_relative "fund_request"
require_relative "project"

crowdfund = FundRequest.new("default")
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
