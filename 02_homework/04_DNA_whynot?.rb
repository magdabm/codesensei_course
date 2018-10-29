# Zasada komplementarności DNA mówi, że znając sekwencję pojedyńczego łańcucha DNA możemy wywnioskować sekwencję jego sąsiedniej nici. Wynika to z faktu, iż zasady azotowe, z których DNA jest zbudowane łączą się w pary zawsze w ten sam sposób, to znaczy Adenina (A) z Tyminą (T), a Cytozyna (C) z Guaniną (G).
# Napisz funckję, która przyjmie ciąg znaków reprezentujący sekwencję DNA i zwróci sekwencję komplementarną. Np:
# complementary_DNA("ATTA") #=> "TAAT"
# complementary_DNA("CGGC") #=> "GCCG"
# complementary_DNA("ACGTTAGTTA") #=> "TGCAATCAAT"


def DNA(sequence)
  sequence = sequence.chars

  new_seq = sequence.map do |s|
    s = "T" if s == "A"
    s = "A" if s == "T"
    s = "C" if s == "G"
    s = "G" if s == "C"
  end
new_seq.join
end

puts DNA("ATTA")
puts DNA("CGGC")
puts DNA("ACGTTAGTTA")
