# Napisz program będący prostym kalkulatorem, z którym interakcja wygląda jak na poniższym przykładzie:
# Choose operation:
# 1. Add numbers
# 2. Subtract numbers
# 3. Multiply numbers
# 4. Divide numbers
# 5. Quit
# What is your choice?: 1
# Enter first number: 4
# Enter second number: 9
# ==> 4 + 9 = 13
# Choose operation:
# 1. Add numbers
# 2. Subtract numbers
# 3. Multiply numbers
# 4. Divide numbers
# 5. Quit
# What is your choice?: 4
# Enter first number: 12
# Enter second number: 4
# ==> 12 / 4 = 3
# Choose operation:
# 1. Add numbers
# 2. Subtract numbers
# 3. Multiply numbers
# 4. Divide numbers
# 5. Quit
# What is your choice?: 5
# Bye, bye
# Pamiętaj o dzieleniu przez 0!


loop do

  puts "Choose operation:"
  puts "1. Add numbers"
  puts "2. Subtract numbers"
  puts "3. Multiply numbers"
  puts "4. Divide numbers"
  puts "5. Quit"
  puts "What is your choice?"

  ch = gets.to_i

  if ch == 5
    puts "Bye, Bye!"
    exit
  elsif ch == 1
    puts "Enter first number:"
    n1 = gets.to_i
    puts "Enter second number:"
    n2 = gets.to_i
    puts "#{n1} + #{n2} = #{n1 + n2}"
    puts
    sleep 1
  elsif ch == 2
    puts "Enter first number:"
    n1 = gets.to_i
    puts "Enter second number:"
    n2 = gets.to_i
    puts "#{n1} - #{n2} = #{n1 - n2}"
    puts
    sleep 1
  elsif ch == 3
    puts "Enter first number:"
    n1 = gets.to_i
    puts "Enter second number:"
    n2 = gets.to_i
    puts "#{n1} * #{n2} = #{n1 * n2}"
    puts
    sleep 1
  elsif ch == 4
    puts "Enter first number:"
    n1 = gets.to_i
    puts "Enter second number:"
    loop do
      n2 = gets.to_i
      if n2 == 0
        puts "Can not divide by 0. Enter different number."
      else
        break
      end
    end
    puts "#{n1} / #{n2} = #{n1 / n2.to_f}"
    puts
    sleep 1
  else ch != 1 && ch != 2 && ch != 3 && ch != 4 && ch != 5
    puts "Wrong choice. Choose one more time."
    puts
    sleep 2
  end
end
