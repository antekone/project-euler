# project euler #2 in Ruby, by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ ruby 2.rb
#

# iterative version of calculating fibonacci numbers
def getfib(n)
	r = 1

	p1 = 1
	p2 = 0

	1.upto(n) do |i|
		r = p2 + p1
		p2 = p1
		p1 = r
	end

	r
end

sum = 0
i = 0
f = 0

while f < 4000000
	sum += f if (f % 2) == 0
	i += 1
	f = getfib(i)
end

puts("#{sum}")
