# Dla podanych imion stwórz prosty plik csv. Zastosuj metodę join i split.
# Pierwsza kolumna to inicjały gracza a druga to jego imię i nazwisko
# https://ruby-doc.org/core-2.5.0/String.html#method-i-split
# https://ruby-doc.org/core-2.5.0/Array.html#method-i-join
# => DS, Derek Smith

players = ["Derek Smith",
"Calvin Natt",
"Kareem Abdul-Jabbar",
"Larry Bird",
"Darrell Griffith"]

players.each do |p|
  name = p.split[0]
  surname = p.split[1]
  in1 = p.split[0][0]
  in2 = p.split[1][0]
  puts "#{in1}#{in2}, #{name} #{surname}"
end
puts

# lub

players = ["Derek Smith",
  "Calvin Natt",
  "Kareem Abdul-Jabbar",
  "Larry Bird",
  "Darrell Griffith"]

players.each do |player|
  names = player.split
  puts [names[0][0] + names[1][0], player].join(", ")
end
puts

# lub

players = ["Derek Smith",
  "Calvin Natt",
  "Kareem Abdul-Jabbar",
  "Larry Bird",
  "Darrell Griffith"]

result = players.map do |player|
  names = player.split
  [names[0][0] + names[1][0], player].join(", ")  # a jak bez join?
end.join("\n")
puts result
