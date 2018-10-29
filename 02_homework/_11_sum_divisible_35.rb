# Napisz metodę, która dla podanego argumentu n znajdzie wszystkie liczby całkowite w przedziale 0 do n, które sa podzielne przez 3 lub 5 i zwróci sumę tych liczb.
# multiples(10) #=> 33  (3 + 5 + 6 + 9 + 10)
# multiples(20) #=> 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20)

def div35(n)
  sum = 0
  (0..n).each do |elem|
    sum += elem if elem % 3 == 0 || elem % 5 == 0
  end
sum
end

puts div35(40)

# lub

def multiples(n)
  i = 1
  sum = 0
  while i <= n
    sum += i if i % 3 == 0 || i % 5 == 0
    i = i + 1
  end
sum
end

puts multiples(40)

# lub

def multiples35(n)
  i = 1
  sum = 0
  while i <= n
    if i % 15 == 0
      sum += i
    elsif i % 5 == 0
      sum += i
    elsif i % 3 == 0
      sum += i
    end
    i += 1
  end
  sum
end

puts multiples(40)
