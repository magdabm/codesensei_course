# Oto szkielet programu.
# def find_index(array, value)
# end
# find_index([1, 2, 3, 4, 5], 3) => 2
# find_index([5, 8, 6, 2, 2, 10], 2) => 3
# find_index([10, 20, 30], 100) => not found
# find_index([], 0) => not found
# Twoim zadaniem jest zaimplementowanie metody find_index tak, aby wypisywała indeks (liczbę), pod którym znajduje się wartość value w tablicy array . Jeśli elementu nie ma w tablicy metoda powinna wypisać “not found”. Jeśli elementów o danej wartości jest więcej niż jeden funkcja powinna wypisać indeks pierwszego z nich. Postaraj się zaimplementować najpierw tę metodę używając zwykłej pętli. Kiedy Ci się to uda zrób to jeszcze raz, ale z pomocą metody Array#index.


def find_index(array, value)
  i = 0
  index = "not found"
  while i < array.length
    if array[i] == value
      index = i
      break
    end
    i += 1
  end
  index
end

puts find_index([1, 2, 3, 4, 5], 3) # => 2
puts find_index([5, 8, 6, 2, 2, 10], 2) # => 3
puts find_index([10, 20, 30], 100) # => not found
puts find_index([], 0) # => not found
