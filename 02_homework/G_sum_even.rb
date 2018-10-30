# Napisz funkcję, która liczy sumę parzystych liczb z zakresu od 1..n. Spróbuj stwórzyć kilka wersji:
# • korzystając z wybranej pętli, np. while
# • korzystając z metod Range#step i Enumerable#sum
# • wyprowadzając/znajdując wzór na sumę takich liczb (podpowiedź: jest to ciąg arytmetyczny)

# solution 1 (while)
def sum_of_even(num)
  i = 0
  sum = 0
  while i <= num
    sum += i
    i += 2
  end
  sum
end
puts sum_of_even(7)
puts sum_of_even(8)


# solution 2 (Range#step + Enumerable#sum)
def sum_of_even(num)
  (0..num).step(2).sum
end
puts sum_of_even(7)
puts sum_of_even(8)


# solution 3 (wg wzoru)
def sum_of_even(num)
  sum = (2 + num) / 2 * (2..num).step(2).count
end
puts sum_of_even(7)
puts sum_of_even(8)


# solution 3 (inne - block)
def sum_of_even(num)
  sum = 0
  (1..num).each do |elem|
    sum += elem if elem.even?
  end
  sum
end
puts sum_of_even(7)
puts sum_of_even(8)
