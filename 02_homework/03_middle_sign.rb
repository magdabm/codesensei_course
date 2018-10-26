# Napisz funkcję, która znajdzie i zwróci środkowy znak w stringu. Jeśli długość stringa jest liczbą parzystą zwróć dwa środkowe znaki. Np:
# middle("abc") #=> "b"
# middle("middle") #=> "dd"
# middle("tesTing") #=> "T"


def middle_sign(string)

  a_string = string.chars

  if a_string.length % 2 == 0
    middle = [a_string[a_string.length / 2], a_string[a_string.length / 2 - 1]].join
  else
    middle = a_string[a_string.length / 2]
  end

middle
end

puts middle_sign("abc")
puts middle_sign("middle")
puts middle_sign("tesTing")
