# Algorytm, który wczytuje liczbę i wypisuje jej sumę cyfr (np. dla liczby 378 wypisuje 18). Skorzystaj z operacji % 10 aby pobrać wartość ostatniej cyfry.


puts "Enter the number:"
num = gets.to_i             # zmiana wprowadzonej liczby na cyfry, aby wykonać obliczenie reszty z dzielenia

num % 10 = dig_last      # przypisanie zmiennej dig_last wartości reszty z dzielenia

digits = num.to_s.chars     # zmiana wprowadzonej liczby w string, a następnie w tablicę

amount = digits.count       # policzenie elementów tablicy (= ilość cyfr w liczbie wprowadzonej użytkownika)

i = 0
sum = 0

while amount > i + 1
  sum = sum + digits[i].to_i    # policzenie sumy cyfr podanej liczby, bez ostatniej
  i += 1
end

sum2 = sum + dig_last           # policzenie ostatecznej sumy cyfr

puts "Sum of digits of your number is: #{sum2}."
