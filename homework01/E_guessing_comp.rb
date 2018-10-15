puts "Let's play the game. Think of a number from 0 to 99. I will try to guess. Give me the tips by writing \"more\" or \"less\", or write \"ok\" when I guess.
Let's begin."

a = 0
b = 99
c = (a + b) / 2


puts "Is it: #{rand (100)}?"

tip = gets.chomp

if tip == "more"
  puts rand (c - b)
elsif tip == "less"
  puts rand (a - c)
else tip  == "ok"
  puts "Yeah!!!"
  exit
end
