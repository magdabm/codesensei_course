#  Algorytm wczytujący 2 liczby i sprawdzający czy są one ułożone w kolejności rosnącej (każda kolejna musi być większa od poprzedniej). Jeśli tak to wypisuje "Ciąg jest rosnący", w przeciwnym przypadku "Ciąg nie jest rosnący".


puts "Give two numbers:"
num1 = gets.to_i
num2 = gets.to_i

if num2 > num1
  puts "The sequence of numbers is growing."
else
  puts "The sequence of numbers is not growing."
end
