puts ARGV     # tylko taki plik (z puts ARGV) po wprowadzeniu do konsoli i dodaniu po spacji argumentów wywołuje je (irb)

if ARGV.count < 2
  puts 'Usage: argv.rb show "Your argument to show"'
  exit
end

if ARGV[0] == "show"
  puts "My argument is #{ARGV[1]}"
end
