puts "Podaj pierwszą liczbę:"
num1 = gets.to_i
puts "Podaj drugą liczbę:"
num2 = gets.to_i

if num1 > num2
  puts "Większa liczba to: #{num1}."
elsif num1 == num2
  puts "Liczby są równe."
else
  puts "Większa liczba to: #{num2}."
end
