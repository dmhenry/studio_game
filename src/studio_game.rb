# frozen_string_literal: true

name1 = "larry"
name2 = "curly"
name3 = "moe"
name4 = "shemp"
health1 = 60
health2 = health1
health1 = 30
health3 = 90
health4 = 100

puts "#{name1.capitalize}'s health is #{health1}."
puts "#{name2.upcase}'s health is #{health2}."
puts "#{name3.capitalize}'s health is #{health3}.".center(50, '*')
puts "#{name4.capitalize.ljust(30, '.')} #{health4}."

now = Time.new
puts "The game started on #{now.strftime('%A %m/%e/%Y')} at #{now.strftime('%I:%M %p')}."
