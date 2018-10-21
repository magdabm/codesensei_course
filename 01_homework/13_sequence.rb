# Algorytm, który wczytuje liczbę n i wypisuje na ekran kolejne liczby 1..n. Jeśli na wejściu podano liczbę < 1 należy wypisać komunikat "Liczba musi być > 0" i zakończyć algorytm.


puts "Enter the number:"
num = gets.to_i

i = 1

if num <= 0
  puts "Number must be greater than \"0\"."
  exit
end

puts "Sequence of numbuers from \"1\" to your number:"

while num >= i
  puts "#{i}"
  i += 1
end
