puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

r = 0

if a > b
  while b != 0
    a % b == r
    a = b
    b = r
  end
else
  while a != 0
    b % a == r
    b = a
    a = r
  end
end

if a > b
  puts "NWD Twoich liczb to: #{a}"
else
  puts "NWD Twoich liczb to: #{b}"
end
