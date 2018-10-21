# Algorytm, który wczytuje od użytkownika liczby tak długo aż poda 0. Na końcu wypisuje sumę liczb ujemnych oraz sumę liczb dodatnich z tych, które zostały wczytane. Np. dla liczb 6, 8, -2, 1, -3, 0 wypisze "Suma dodatnich: 15" i "Suma ujemnych: -5".


sum_p = 0
sum_n = 0

loop do

  puts "Enter the number:"
  num = gets.to_i

  if num != 0
    sum_p = sum_p + num if num > 0
    sum_n = sum_n + num if num < 0
  else
    puts "The sum of positive numbers is: #{sum_p}"
    puts "The sum of negative numbers is: #{sum_n}"
    exit
  end

end
