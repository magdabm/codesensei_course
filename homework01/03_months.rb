puts "Enter the number of the month, I will give number of days:"
month = gets.to_i

if month == 1 && month == 3 && month == 5 && month == 7 && month == 8 && month == 10 && month == 11
  puts "Number of days: 31."
elsif month == 2
  puts "Number of days: 28."
else
  puts "Number of days: 30."
end
