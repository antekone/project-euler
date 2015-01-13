# project euler #1 in ruby by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ ruby 1.rb

sum = 0

1000.times do |i|
    sum += i if i % 3 == 0 or i % 5 == 0
end

puts(sum)
