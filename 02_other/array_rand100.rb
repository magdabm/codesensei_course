# Wygeneruj 100-elementową tablicę losowych liczb z zakresu od 0 do 99. Następnie korzystając z metody Array#group_by, stwórz hash, gdzie kluczem będzie reszta z dzielenia elementu przez 10.
# Zapoznaj się z dokumentacją metody Hash#transform_values . Wykorzystaj ją dla hasha z poprzedniego ćwiczenia, by sprawdzić ile elementów posiada każda z grup.
# Przykład: dla danych wejściowych: [1, 11, 2, 3]
#           wyjście: { 1 => 2, 2 => 1, 3 => 1 }


arr_100 = Array.new(10) { rand(100) }    # tak samo jak: do |i| rand(100) end

puts arr_100.inspect
puts
"\n"


arr_grouped = arr_100.group_by { |i| i % 10 }    # tak samo jak: do |i| i%10 end

puts arr_grouped
puts


arr_trans = arr_grouped.transform_values { |i| i.length }

puts arr_trans
puts
