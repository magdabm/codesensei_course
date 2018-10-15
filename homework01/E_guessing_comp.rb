puts "Let's play the game. Think of a number from 0 to 99. I will try to guess. Give me the tips by writing \"more\" or \"less\", or write \"ok\" when I guess.
Let's begin."

a = 0
b = 99

loop do

  c = (a + b) / 2

  puts "Is it: #{c}?"

  tip = gets.chomp

  if tip == "more"
    a = c
  elsif tip == "less"
    b = c
  else tip == "ok"
    puts "Yeah!!!"
    exit
  end

end
