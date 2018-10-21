
p = 4
c = 1

2.times do

    4.times do
      puts " " * p + "*" * c + " " * p
      p -= 1
      c += 2
    end

    p += 3
    c -= 6

end

puts " " * 4 + "*" * 1 + " " * 4
