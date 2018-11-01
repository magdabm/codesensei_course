# Napisz metodę map, która pobierze tablicę oraz blok, a następnie zwróci nową tablicę, której długość będzie identyczna jak tablicy wejściowej, a element nowej tablicy będzie rezultatem wykonania bloku na odpowiadającym elemencie starej tablicy. Przykład:
# map([1, 2, 3]) { |elem| elem**3 }  =>  [1, 8, 27]


def map(array)
  new_array = array.map do |e|
    e * 5
  end
  new_array
end

puts map([1,2,3,4]).inspect

# lub:

[1, 2, 3].map { |elem| elem**3 }

# lub: (????????)

def map1([1,2,3,4])
  result = []
  source.each do |element|
    result << yield(element)
    end
result
end

map1 do
end


puts map1([1,2,3,4])  # nie działa
