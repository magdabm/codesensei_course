puts "How many levels you want your tree would have? You can choose between 1 and 7."
lvl = gets.to_i

exit if lvl > 7
exit if lvl == 0

p = 9
c = 1

lvl.times do

  4.times do
    puts " " * p + "*" * c + " " * p
    p = p - 1
    c = c + 2
  end

  p = p + 3
  c = c - 6

end

puts " " * 9 + "*" * 1 + " " * 9
