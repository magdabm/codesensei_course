# Algorytm, który wczytuje liczbę i wypisuje jej sumę cyfr (np. dla liczby 378 wypisuje 18). Skorzystaj z operacji % 10 aby pobrać wartość ostatniej cyfry.


puts "Enter the number:"
num = gets.chomp

digits = num.chars

sum = digits[0].to_i + digits[1].to_i + digits[2].to_i

puts "Sum of digits of your number is: #{sum}."
