# Algorytm, który wczytuje od użytkownika liczby tak długo aż poda 0. Na końcu wypisuje komunikat "Wystąpiła liczba ujemna" jeśli chociaż raz podana została liczba ujemna oraz komunikat "Wystąpiła liczba dodatnia" jeśli chociaz raz podana została liczba dodatnia.


pos = 0
neg = 0

loop do

  puts "Enter the number:"
  num = gets.to_i

  if num != 0
    pos = num if num > 0
    neg = num if num < 0
  else
    puts "The positive number was entered." if pos != 0
    puts "The negative number was entered." if neg != 0
    exit
  end

end
