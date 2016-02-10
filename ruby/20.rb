puts (1..100).reduce(:*).to_s.chars.map {|x| x.to_i}.reduce(:+)
