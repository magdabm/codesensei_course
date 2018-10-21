#  Algorytm wczytujący 3 liczby i sprawdzający czy są one ułożone w kolejności rosnącej (każda kolejna musi być większa od poprzedniej). Jeśli tak to wypisuje "Ciąg jest rosnący", w przeciwnym przypadku "Ciąg nie jest rosnący".


puts "Give three numbers:"
num1 = gets.to_i
num2 = gets.to_i
num3 = gets.to_i

if num1 < num2
  if num2 < num3
    puts "The sequence of numbers is growing."
  else
    puts "The sequence of numbers is not growing."
  end
else
  puts "The sequence of numbers is not growing."
end
