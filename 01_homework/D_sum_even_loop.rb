puts "Enter the number:"
num  = gets.to_i

i = 0
sum = 0

loop do
  sum += i
  i += 2
  break if i > num
end

puts "The sum of even numbers from 0 to \"#{num}\" is: #{sum}."
