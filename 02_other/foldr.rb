# Napisz metodę foldr, która pobierze pewną początkową wartość accumulator oraz tablicę, a następnie dla każdego elementu pobranej tablicy wywoła przekazany blok przekazując do niego aktualną wartość akumulatora oraz element. Wartość zwróconą przez blok należy przypisać do akumulatora, a na końcu zwrócić.
# Przykład:
# foldr(0, [3, 4, 65, 9]) { |acc, elem| elem - acc }  =>  55 # 3 - (4 - (65 - (9 - 0)))

def foldr(a, array)
  array.each do |e|
    e - a
  end
  a
end

puts foldr(0, [3,4,65,9])   # nie działa


def foldr(acc, array)
  array.reverse.each do |elem|
    acc = yield(acc, elem)
  end
end
