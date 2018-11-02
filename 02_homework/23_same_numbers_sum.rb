# Napisz funkcję consecutives_sum, która dla trzymanej tablicy liczb obliczy sumę kolejnych liczb o tej samej wartości. Funkcja powinna zwracać tablice tych sum. Przykładowo:
# consecutives_sum([1, 4, 4, 4, 0, 4, 3, 3, 1]) #=> [1, 12, 0, 4, 6, 1]
# consecutives_sum([1, 1, 7, 7, 3]) #=> [2, 14, 3]
# consecutives_sum([-5, -5, 7, 7, 12, 0]) #=> [-10, 14, 12, 0]

def consecutives_sum(array)
  i = 0
  n = 1
  index_sum = 0
  sum_array = []

  while i < array.length
    n = 1

    if array[i] == array[i+1]

      while i < array.length
        if array[i] == array[i+1]
          n += 1
        else
          index_sum = n * array[i]
          sum_array << index_sum
          break
        end
        i += 1
      end

    else
      sum_array << array[i]
    end
    i += 1
  end

sum_array.inspect
end

puts consecutives_sum([1, 4, 4, 4, 0, 4, 3, 3, 1])
puts consecutives_sum([1, 1, 7, 7, 3])
puts consecutives_sum([-5, -5, 7, 7, 12, 0])
