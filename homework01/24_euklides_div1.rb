puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

while b != 0 && a != 0
  if a > b
    r = a % b
    a = b
    b = r
  else
    r = b % a
    b = a
    a = r
  end
end

if a > b
  puts "NWD Twoich liczb to: #{a}"
else
  puts "NWD Twoich liczb to: #{b}"
end
