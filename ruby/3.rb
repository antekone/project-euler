# Project Euler problem #3 in Ruby
# by antekone
#
# http://anadoxin.org/blog

# Fermat factorization
def fermat(n)
  if n % 2 == 0
    [2, n / 2]
  else
    a = Math.sqrt(n).to_i
    a -= 1
    b = 0

    loop do
      a += 1
      f = a * a - n

      if f > 0
        b = Math.sqrt(f).to_i
      else
        b = 0
      end

      break if b * b == f
    end

    [a - b, a + b]
  end
end

# Find prime factors by tree generation
def fermat_tree(n)
  changed = false
  factors = [n]
  primefactors = []

  loop do
    changed = false
    nfactors = []

    while not factors.empty?
      n = factors[0]
      pair = fermat(n)
      factors = factors.drop(1)

      if pair.min == 1
        primefactors << pair.max
      else
        nfactors << pair[0] << pair[1]
        changed = true
      end
    end

    factors = nfactors

    break if not changed
  end

  primefactors
end

# Entrypoint
puts fermat_tree(600851475143).max
