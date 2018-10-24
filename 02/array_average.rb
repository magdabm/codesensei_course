# Napisz program który liczy średnią i medianę dla zadanej tablicy. Mediana - w danym szeregu uporządkowanym liczba, która jest w połowie szeregu w wypadku nieparzystej liczby elementów. Dla parzystej liczby elementów – średnia arytmetyczna dwóch środkowych liczb.
# array1 = [1, 2, 2, 4, 5, 6, 7, 7, 7, 9]
# array2 = [2, 2, 3, 3, 3, 5, 6]
# array3 = [2, 3, 3, 4, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9]


a1 = [1, 2, 2, 4, 5, 6, 7, 7, 7, 9]
a2 = [2, 2, 3, 3, 3, 5, 6]
a3 = [2, 3, 3, 4, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9]

i = 0
sum_a1 = 0

while i <= a1.length
  sum_a1 = sum_a1 + a1[i].to_i
  i += 1
end

av1 = sum_a1 / a1.length

puts "Średnia wartość z tablicy a1 to: #{av1.to_f}"


i = 0
sum_a2 = 0

while i <= a2.length
  sum_a2 = sum_a2 + a2[i].to_i
  i += 1
end

av2 = sum_a2 / a2.length.to_f

puts "Średnia wartość z tablicy a2 to: #{av2}"


i = 0
sum_a3 = 0

while i <= a3.length
  sum_a3 = sum_a3 + a3[i].to_i
  i += 1
end

av3 = sum_a3/ a3.length.to_f

puts "Średnia wartość z tablicy a3 to: #{av3}"



def average(array)
  sum_array = 0
  i = 0
  while i <= array.length
    sum_array = sum_array + array[i].to_i
    i += 1
  end
  av = sum_array / array.length.to_f
end

puts average([2, 2, 3, 3, 3, 5, 6])
