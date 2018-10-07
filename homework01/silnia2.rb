puts "Podaj liczbę, aby uzyskać wartość silnia:"
n = gets.to_i

wynik = 1
i = 1

while n > i
  i += 1
  wynik *= i
end

puts "Silnia to: #{wynik}."
