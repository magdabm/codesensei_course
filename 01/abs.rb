puts "Wartość bezwzględna, podaj liczbę:"
num = gets.to_i

if num >= 0
  result = num
else
  result = num * -1
end

puts "Wynik:"
puts result
