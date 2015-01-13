-- project euler #1 in lua by antekone
-- http://anadoxin.org/blog
--
-- usage:
--
-- $ lua 1.lua

sum = 0
for i = 0, 999 do
	if (i % 3 == 0) or (i % 5 == 0) then
		sum = sum + i
	end
end

print(sum)
