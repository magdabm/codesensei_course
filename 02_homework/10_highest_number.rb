# Napisz funkcję, ktora przyjmie liczbę całkowitą i pozamienia jej cyfry miejscami w taki sposób, aby utworzyć jak najwyższą liczbę. Np:
# highest_number(132) #=> 321
# highest_number(1464) #=> 6441
# highest_number(165423) #=> 654321


def change_to_highest(num)
  new_num = num.digits.sort.reverse.join
end

puts change_to_highest(132)
puts change_to_highest(1464)
puts change_to_highest(165423)
