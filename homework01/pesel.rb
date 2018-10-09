puts "Wprowadź PESEL:"
pesel = gets.chomp

a = pesel.chars   # a zamiast array

control = 9 * (a[0].to_i + a[4].to_i + a[8].to_i) +
          7 * (a[1].to_i + a[5].to_i + a[9].to_i) +
          3 * (a[2].to_i + a[6].to_i) + a[3].to_i + a[7].to_i

puts "Informacje o PESELu:"

if a.count == 11  &&  control % 10 == a[10].to_i
  puts "PESEL jest poprawny."
  if a[9].to_i % 2 == 0
    puts "Płeć: kobieta."
  else
    puts "Płeć: mężczyzna."
  end
else
  puts "PESEL jest niepoprawny."
end

puts "Data urodzenia: #{a[4, 2].join}-#{a[2, 2].join}-19#{a[0, 2].join}"
