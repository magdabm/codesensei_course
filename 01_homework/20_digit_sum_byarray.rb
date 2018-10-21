# Algorytm, który wczytuje liczbę i wypisuje jej sumę cyfr (np. dla liczby 378 wypisuje 18). Skorzystaj z operacji % 10 aby pobrać wartość ostatniej cyfry.


puts "Enter the number:"
num = gets.chomp.chars

length = num.length

i = 0
sum = 0

length.times do
  sum = sum + num[i].to_i
  i += 1
end

puts "Sum of digits of your number is: #{sum}."
