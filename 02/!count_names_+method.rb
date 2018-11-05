# Napisz program, który pozwala wprowadzać imiona przez użytkownika a następnie wyświetla statystyki wprowadzonych danych. Program pobiera dane dopóki nie zostanie podane słowo stop.


def stats_display(user_name, name_count)
  "Imię #{user_name}, wprowadzono #{name_count} razy"
end

stats = {}   # empty hash
loop do
  puts "Podaj Imię:"
  name = gets.chomp
  break if name == "stop"

  stats[name] = stats[name].to_i + 1   # gdyby nie było .to_i to będzie błąd: undefined method `+' for nil
end

puts "Statystyki imion:"
stats.each do |name, count|
  puts stats_display(name, count)
end

puts stats   # tylko żeby zoabczyć jaki hash się utworzył
