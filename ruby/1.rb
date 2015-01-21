# Project Euler #1 in Ruby, by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ ruby 1.rb

puts (0...1000).reject { |i| !(i % 3 == 0 or i % 5 == 0) }.inject(0) { |i,j| i + j }
