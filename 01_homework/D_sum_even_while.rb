puts "Enter the number:"
num  = gets.to_i

i = 0
sum = 0

while i <= num
  sum += i
  i += 2
end

puts "The sum of even numbers from 0 to \"#{num}\" is: #{sum}."
