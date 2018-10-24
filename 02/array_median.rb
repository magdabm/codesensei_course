# Napisz program który liczy średnią i medianę dla zadanej tablicy. Mediana - w danym szeregu uporządkowanym liczba, która jest w połowie szeregu w wypadku nieparzystej liczby elementów. Dla parzystej liczby elementów – średnia arytmetyczna dwóch środkowych liczb.
# array1 = [1, 2, 2, 4, 5, 6, 7, 7, 7, 9]
# array2 = [2, 2, 3, 3, 3, 5, 6]
# array3 = [2, 3, 3, 4, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9]

def mediana(array)
  if array.length % 2 == 1
    med = array[array.length.to_f / 2]
  else
    med = (array[array.length / 2].to_f + array[array.length / 2 - 1]) / 2
  end
  med
end
array = [2, 3, 3, 4, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9]
my_var = mediana(array)
puts "Mediana z tablicy to: #{my_var}" # lub po prostu puts "Mediana z tablicy to: #{mediana(array)}"

# lub:

my_array = [1,2,6,4,5]

def median(numbers)
  if numbers.length.even?
    mediana = (numbers[numbers.length / 2] + numbers[numbers.length/ 2-1]) / 2.0
  else
    mediana = numbers[numbers.length / 2]
  end
  mediana
end
puts "Moja mediana #{median(my_array)}"

def print_mean_and_median(numbers)
  puts "Widok z mojej metody"
  puts "Moja mediana #{median(numbers)}"
end

print_mean_and_median(my_array)
