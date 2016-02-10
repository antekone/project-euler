words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
buf = ""

(1..1000).each do |i|
  if i / 100 > 0 and i % 100 == 0 and i < 1000
    buf += "%s hundred" % words[i / 100]
  elsif i > 100 and i < 1000
    buf += "%s hundred and " % words[i / 100]
    i -= (i / 100) * 100
  end

  if i >= 1 and i < 10
    buf += words[i]
  elsif(i > 9 && i % 10 == 0 and i < 100)
    buf += tens[i / 10]
  elsif(i > 10 && i < 20)
    buf += words[i]
  elsif(i > 19 and i < 100)
    buf += "%s-%s" % [tens[i / 10], words[i % 10]]
  elsif(i == 1000)
    buf += "one thousand"
  end
end

puts buf.gsub(/[ -]/, '').size
