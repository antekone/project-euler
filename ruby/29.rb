memory = []

99.times do |a|
    99.times do |b|
        x = (2 + a) ** (2 + b)
        memory << x if memory.index(x) == nil
    end
end

p memory.size
