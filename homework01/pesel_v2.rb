puts "Wprowadź pesel"
pesel = gets

array = pesel.chars

puts "Informacje o PESELu:"

if array[9].to_i % 2 == 0
  puts "Płeć: kobieta"
else
  puts "Płeć: mężczyzna"
end

puts "Data urodzenia: #{array[4]}#{array[5]}-#{array[2]}#{array[3]}-19#{array[0]}#{array[1]}"
