# Odległóść Hamminga to “wprowadzona przez Richarda Hamminga miara odmienności dwóch ciągów o takiej samej długości, wyrażająca liczbę miejsc (pozycji), na których te dwa ciągi się różnią”, czyli:
# • odległość Hamminga dla ciągów 'aaa' i 'aab' wynosi 1.
# • odległość Hamminga dla ciągów 'aaabbb' i 'abaaba' wynosi 3.
# Napisz funkcję, która jako argumenty przyjmie dwa stringi i zwróci ich odległość Hamminga. Jeśli podane stringi nie są tej samej długości niech zwróci nil. Np:
# hamming_distance('1234', '1235') #=> 1
# hamming_distance('GAGCCT', 'CATCGT') #=> 3
# hamming_distance('1234', '12345') #=> false
# hamming_distance('123', 'foobar') #=> nil


def hamming(str1, str2)
  str1 = str1.chars
  str2 = str2.chars
  i = 0
  hamming = 0
  if str1.length != str2.length
    nil
  else
    while i < str1.length
      if str1[i] != str2[i]
        hamming += 1
      end
      i += 1
    end
  end
hamming
end

puts hamming("1234", "1235")
puts hamming("GAGCCT", "CATCGT")
puts hamming("1234", "12345") #=> false
puts hamming("123", "foobar") #=> nil
