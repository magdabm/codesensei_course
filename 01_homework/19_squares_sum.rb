# Algorytm, który wczytuje liczbę n, a następnie liczy i wypisuje sumę kwadratów liczb 1..n (1 + 4 + 9 + ... + n^2).


puts "Enter the number:"
num = gets.to_i

i = 1
sum = 0

while num >= i
  sum = sum + i**2
  i += 1
end

puts "Sum of squares of numbers from \"1\" to your number is: #{sum}."
