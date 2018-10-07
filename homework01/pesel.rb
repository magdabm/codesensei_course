puts "Wprowadź pesel"
pesel = gets

a = pesel.chars   # a zamiast array

control = 9*a[0]+7*a[1]+3*a[2]+1*a[3]+9*a[4]+7*a[5]+3*a[6]+1*a[7]+9*a[8]+7*a[9]

while



puts "Informacje o PESELu:"

if array[9].to_i % 2 == 0
  puts "Płeć: kobieta"
else
  puts "Płeć: mężczyzna"
end

puts "Data urodzenia: #{array[4].to_i}#{array[5].to_i}-#{array[2].to_i}#{array[3].to_i}-19#{array[0].to_i}#{array[1].to_i}"
