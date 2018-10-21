# Algorytm, który wczytuje liczbę n i wypisuje na ekran kolejne parzyste liczby z zakresu 2..n. Jeśli na wejściu podano liczbę < 2 należy wypisać komunikat "Liczba musi być > 1" i zakończyć algorytm.


puts "Enter the number:"
num = gets.to_i

i = 2

if num < 2
  puts "Number must be greater than \"1\"."
  exit
end

puts "Sequence of even numbuers from \"2\" to your number:"

while num >= i
  puts "#{i}"
  i += 2
end
