puts "Wprowadź liczby:"
a = gets.to_i
b = gets.to_i

r = 0

while b != 0
  a % b = r
  a = b
  b = r
end


puts "NWD Twoich liczb to: #{a}"
