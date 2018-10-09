loop do
  puts "Are you lucky?"
  break if rand < 0.5  # tu następuje wywołanie liczby i od razu sprawdzenie warunku,
  puts "no"            #  jeśli rand < 0,5 otrzymujemy "yes", jeśli > to "no" i następuje kolejne wywołanie
end

puts "yes!"
