puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

r = 0

while b != 0 && a != 0
  if a > b
    a % b == r
    a = b
    b = r
  else
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
