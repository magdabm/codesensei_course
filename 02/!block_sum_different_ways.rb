# Napisz program który zsumuje długości poszczególnych elementów ["a", "bb", "ccc", "dddd", "eeeee"]

array = ["a", "bb", "ccc", "dddd", "eeeee"]
# Najpierw różnica pomiędzy each a map. Nawet jeśli przypiszemy tablicy array nową nazwę (map) przy okazji wykonywania na niej bloku, nie otrzymamy nowej tablicy z nowymi wartościami. Wynik bloku nie zostanie zapisany, stara tablica zyska tylko nową nazwę i będzie taka sama jako array i new.
array_2 = array.each do |e|
  puts e.length
end
puts "each / to jest nowy array_2 #{array_2}"
puts "each / to jest array #{array}"
# Natomiast jeśli użyjemy metody map w tym samym miejsu co each, stary array zostanie taki sam, a nowy po użyciu metody zostanie zapisany z wartościami "nil".
array_2 = array.map do |e|
  puts e.length
end
puts "map / to jest nowy array_2 #{array_2}"
puts "map / to jest array #{array}"



suma = 0
["a", "bb", "ccc", "dddd", "eeeee"].each do |value|
  suma += value.length
end
puts "pierwsza suma #{suma}"

# lub

suma = ["aaa", "bb", "ccc", "dddd", "eeeee"].map do |value|
  value.length
end.sum
puts "to jest druga suma #{suma}"

# lub

suma = ["aaaaaa", "bb", "ccc", "dddd", "eeeee"].sum do |value|
  value.length
end
puts "to jest trzecia suma #{suma}"

# lub

suma = ["a", "bb", "ccc", "dddd", "eeeee"].sum(100) do |value|   # sum(100) daje jako początkową wartość 100
  value.length
end
puts "Suma tablicy z początkową wartością #{suma}"
