sum = 0

1000.times do |i|
    sum += i if i % 3 == 0 or i % 5 == 0
end

puts(sum)
