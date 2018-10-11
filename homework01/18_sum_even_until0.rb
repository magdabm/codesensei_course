# Algorytm, który wczytuje liczby tak długo aż nie zostanie podana liczba 0, a następnie wypisuje sumę liczb parzystych.


sum = 0

loop do

  puts "Enter the number:"
  num = gets.to_i

  if num != 0
    sum = sum + num if num % 2 == 0
  else
    puts "Sum of your numbers is: #{sum}."
    exit
  end

end
