# Napisz program, który pozwala wprowadzać imiona przez użytkownika a następnie wyświetla statystyki wprowadzonych danych. Program pobiera dane dopóki nie zostanie podane słowo stop.

stats = {}
loop do
  puts "Podaj Imię:"
  name = gets.chomp
  break if name == "stop"

  if stats[name]   # if stats[name] jest równoznaczne z if stats[name] != 0
    stats[name] = stats[name] + 1
  else
    stats[name] = 1
  end
  # lub zamiast tego wyżej można napisać: stats[name] = stats[name].to_i + 1, bo jeśli nila przekonwertujemy na 0 to będzie można do niego dodawać
end

puts "Statystyki imion:"
stats.each do |name, count|
  puts "Imię #{name}, wprowadzono #{count} razy"
end

puts stats   # tylko żeby zoabczyć jaki hash się utworzył
