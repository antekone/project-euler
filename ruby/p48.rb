puts 1.upto(1000).inject {|s, i| s += i ** i}.to_s[-10..-1]
