# Algorytm, który wczytuje liczbę i wypisuje jej sumę cyfr (np. dla liczby 378 wypisuje 18). Skorzystaj z operacji % 10 aby pobrać wartość ostatniej cyfry.

# !!!! tylko dla liczb 3-cyfrowych

puts "Enter the 3-digit number:"
num = gets.chomp.chars

digit = num.count

num1 = num.join.to_i              # 378
num2 = num[0, 2].join.to_i        # 37
num3 = num[0].to_i                # 3

a = num1 % 10
b = num2 % 10
c = num3 % 10

puts "Sum of digits of your number is: #{a+b+c}."
