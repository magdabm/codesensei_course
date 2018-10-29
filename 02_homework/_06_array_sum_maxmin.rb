# Napisz funkcję, która jako argument przyjmie tablicę liczb i zwróci sumę wszystkich elementów poza wartością najwyższą i najniższą. Np:
# sum_array([1, 2, 3, 4]) #=> 5
# sum_array([12, 4, 0, -8]) #=> 4
# sum_array([12, 4]) #=> 0
# sum_array([120, 7, 145, -10, -15]) #=> 117

def sum_array(array)
  result = array.sum - array.max - array.min
end

puts sum_array([120, 7, 145, -10, -15])

# lub

def sum_array(array)
  sorted_array = array.sort
  sorted_array.sum - sorted_array[0] - sorted_array[-1]
end

# lub

def sum_array(array)
  array.sort[1...-1].sum    # zakres z 3 kropkami - pomija pierwszy i ostatni element
end
