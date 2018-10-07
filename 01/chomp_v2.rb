loop do
  user_input = gets.chomp
  puts user_input.length

  if user_input.length == 3
    puts "dziękuję"
    break
  else
    puts "liczba nie jest równa 3"
  end
end
