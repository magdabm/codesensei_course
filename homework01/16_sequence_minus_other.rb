# Algorytm, który wczytuje liczbę n i wypisuje kolejno liczby 1, -n, 2, -n+1, 3, -n+2, ..., n, -1 (np. dla n = 3 wypisze 1, -3, 2, -2, 3, -1). Jeśli na wejściu podano liczbę < 1 należy wypisać komunikat "Liczba musi być > 0" i zakończyć algorytm.


puts "Enter the number:"
num = gets.to_i

i = 0

if num <= 0
  puts "Number must be greater than \"0\"."
  exit
end

puts "Sequence of numbuers from \"1\" to your number:"

while num > i
  puts "#{i+1}"
  puts "#{-num+i}"
  i += 1
end
