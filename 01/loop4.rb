loop do
  num = rand
  puts num
  puts "Are you lucky?"
  break if num < 0.5
  puts "No..."
end

puts "Yes!"
