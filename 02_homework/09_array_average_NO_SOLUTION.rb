# Napisz funkcję, która przyjmie dowolną liczbę tablic (o tej samej długości) i zwróci jedną tablicę składającą się z wartości średnich elementów na poszczególnych indeksach przyjętych tablic. Np:
# avg_array([1, 3, 5], [3, 5, 7]) #=> [2, 4, 6]
# avg_array([1, 5, 3, 22], [12, 22, 13, 5], [5, 12, 24, 5], [14, 40, 5, 17]) #=> [8, 19.75, 11.25, 13.5]

# dla dwóch tablic, nie działa (tzn. ostatni element w wynikowej tablicy sie dubluje....)

def avg_array(a1, a2)
  a_length = a1.length
  avg_a = []
  i = 0
  while i < (a_length)
    avg_a[i] = (a1[i] + a2[i])/2
    avg_a.push(avg_a[i])
    i += 1
  end
avg_a.inspect
end

puts avg_array([1, 3, 5], [3, 5, 7])
