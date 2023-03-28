# frozen_string_literal: true

projects = { abc: 1000, lnm: nil, xyz: nil }

projects.each do |key, value|
  puts "Project #{key} has \$#{value} in funding." if value
end

puts
puts "Projects:"
projects.each do |key, _|
  puts "  Project #{key.upcase}"
end
