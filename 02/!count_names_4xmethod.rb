# Napisz program, który pozwala wprowadzać imiona przez użytkownika a następnie wyświetla statystyki wprowadzonych danych. Program pobiera dane dopóki nie zostanie podane słowo stop.

# 1. Wywołanie metody print ze zmienną w postaci metody get_names_from_user.



def stats_line(user_name, name_count)
  "Imię #{user_name}, wprowadzono #{name_count} razy"
end

def print_overall_stats(names_stats)
  puts "Statystyki imion:"
  names_stats.each do |name, count|
    puts stats_line(name, count)
  end
end

def increment_counter(value)
  value.to_i + 1
end

def get_names_from_user
  stats = {}
  loop do
    puts "Podaj Imię:"
    name = gets.chomp
    break if name == "stop"
    stats[name] = increment_counter(stats[name])
  end
  stats
end

print_overall_stats(get_names_from_user)
