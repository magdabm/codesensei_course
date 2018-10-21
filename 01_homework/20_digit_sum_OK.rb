puts "Enter the number:"
num = gets.to_i

sum = 0

while num >= 1
  r = num % 10
  num = num / 10
  sum = sum + r
end

puts "Sum of digits of your number is: #{sum}."
