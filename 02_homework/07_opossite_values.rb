# Napisz funkcję, która dla otrzymanej tablicy liczb całkowitych zwraca tablicę tych samych liczb, ale o przeciwnej wartości. Np:
# invert_array([1, 2, 3, 4, 5]) #=> [-1, -2, -3, -4, -5]
# invert_array([1, -2, 3, -4, 5]) #=> [-1, 2, -3, 4, -5]
# invert_array([0]) #=> [0]


def invert_array(array)
  array.map { |elem| elem * (-1) }
end

puts invert_array([1, 2, 3, 4, 5])
puts invert_array([1, -2, 3, -4, 5])
puts invert_array([0])
