puts "Enter the number of Fibonacci sequence elements to display:"
num = gets.to_i

a = 0
b = 1
c = 0

i = 2                 # i = 2 bo 2 pierwsze elementy ciągu są wprowadzone na sztywno

if num == 0
  puts "Fibonacci sequence will not be displayed."
  exit
elsif num == 1
  puts "\"#{num}\" elements of Fibonacci sequence:"
  puts a
  exit
else
  puts "\"#{num}\" elements of Fibonacci sequence:"
  puts a
  puts b
  while i != num
    c = a + b
    puts c
    a = b
    b = c
    i += 1
  end
end
