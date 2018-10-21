# Algorytm, który wczytuje 3 liczby i wypisuje największą z nich (np. dla liczb 6, 8, 3 wypisze 8, dla 9, 3, 1 wypisze 9, a dla liczb 3, 5, 5 wypisze 5).


puts "Enter three numbers:"
num1 = gets.to_i
num2 = gets.to_i
num3 = gets.to_i

if num1 > num2 && num1 > num3
  puts "The bigger number is: #{num1}"
elsif num2 > num1 && num2 > num3
  puts "The bigger number is: #{num2}"
else
  puts "The bigge number is: #{num3}"
end
