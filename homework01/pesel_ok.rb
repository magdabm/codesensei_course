puts "Podaj numer PESEL"
pesel = gets.chomp
pesel_arr = pesel.chars
suma_kontrolna = (9 * (pesel_arr[0].to_i + pesel_arr[4].to_i + pesel_arr[8].to_i)) +
                 (7 * (pesel_arr[1].to_i + pesel_arr[5].to_i + pesel_arr[9].to_i)) +
                 (3 * (pesel_arr[2].to_i + pesel_arr[6].to_i )) +
                 (1 * (pesel_arr[3].to_i + pesel_arr[7].to_i))
if pesel_arr.count == 11 && suma_kontrolna % 10 == pesel_arr[10].to_i
  puts "Pesel jest ok"
  if pesel_arr[9].to_i % 2 == 1
    puts "Płeć: mężczyzna"
  else
    puts "Płeć: kobieta"
  end
  puts "Data urodzenia: 19#{pesel_arr[0, 2].join}-#{pesel_arr[2, 2].join}-#{pesel_arr[4, 2].join}"
else
  puts "Pesel nie jest ok"
end
