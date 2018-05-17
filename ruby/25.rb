r = 1
p1 = 1
p2 = 0
i = 2

loop do
  r = p2 + p1
  p2 = p1
  p1 = r

  if p1.to_s.size >= 1000
    puts "Answer: #{i}"
    break
  end

  i += 1
end
