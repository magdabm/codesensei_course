puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

while a != b
  if a > b
    a = a - b
  else
    b = b - a
  end
end

puts "NWD Twoich liczb to: #{a}"
