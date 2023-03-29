# frozen_string_literal: true

projects = { abc: 1000, lnm: 900, xyz: 800 }

def fmt_project(project, funding = 0)
  "Project #{project} has \$#{funding} in funding."
end

projects.each do |key, value|
  puts fmt_project(key, value)
end

puts
puts "Projects:"
projects.each do |key, _|
  puts "  Project #{key.upcase}"
end
