# Algorytm, który wczytuje 2 liczby, liczący ich sumę i różnicę i wypisujący komunikat "Suma większa od różnicy" jeśli suma jest większa, "Suma jest mniejsza od różnicy" jeśli suma jest mniejsza lub "Suma jest równa różnicy" jeśli obie są sobie równe.


puts "Podaj dwie liczby:"
num1 = gets.to_i
num2 = gets.to_i

sum = num1 + num2

if  num1 >= num2
  diff = num1 - num2
else
  diff = num2 - num1
end

puts "Suma: #{sum}"
puts "Różnica: #{diff}"

if sum == diff
  puts "Suma jest równa różnicy."
elsif sum > diff
  puts "Suma jest większa od różnicy."
else
  puts "Różnica jest większa od sumy."
end

# wariant kodu sprawdzający, która liczba jest większa, żeby zawsze odejmować mniejszą od większej
