puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

if a > b
  while b != 0
    r = a % b
    a = b
    b = r
  end
else
  while a != 0
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
