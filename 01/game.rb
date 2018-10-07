num = rand (100)

puts "Została wygenerowana liczba, zgaduj :)"

loop do

x = gets.to_i

  if num == x
    puts "Gratulacje!!! Odgadłeś liczbę!"
    exit
  elsif num < x
    puts "Nie. Liczba powinna być mniejsza :)"
  else
    puts "Nie. Liczba powinna być większa :)"
  end
end
