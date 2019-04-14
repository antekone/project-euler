# project euler problem #40 solution
# http://anadoxin.org/blog
#
# usage: ruby p40.rb

def get_outputs(indexes)
  beg_idx = 1
  end_idx = 1
  out_arr = []
  n = 0

  while indexes.size > 0
    n += 1
    str_n = n.to_s
    end_idx = beg_idx + str_n.size - 1

    if indexes[0] >= beg_idx && indexes[0] <= end_idx
      idx = indexes[0] - beg_idx
      out_arr << str_n[idx].to_i
      indexes = indexes.drop 1
    end

    beg_idx = end_idx + 1
  end

  out_arr
end

puts get_outputs([1, 10, 100, 1000, 10000, 100000, 1000000]).reduce :*
