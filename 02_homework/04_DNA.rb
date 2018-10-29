# Zasada komplementarności DNA mówi, że znając sekwencję pojedyńczego łańcucha DNA możemy wywnioskować sekwencję jego sąsiedniej nici. Wynika to z faktu, iż zasady azotowe, z których DNA jest zbudowane łączą się w pary zawsze w ten sam sposób, to znaczy Adenina (A) z Tyminą (T), a Cytozyna (C) z Guaniną (G).
# Napisz funckję, która przyjmie ciąg znaków reprezentujący sekwencję DNA i zwróci sekwencję komplementarną. Np:
# complementary_DNA("ATTA") #=> "TAAT"
# complementary_DNA("CGGC") #=> "GCCG"
# complementary_DNA("ACGTTAGTTA") #=> "TGCAATCAAT"


def DNA(sequence)
  sequence = sequence.chars

  new_seq = sequence.map do |s|
    if s == "A"       # dlaczego nie działa rozwiązanie s = "T" if s == "A" (zapis w jednej linijce)?
      s = "T"
    elsif s == "T"
      s = "A"
    elsif s == "C"
      s = "G"
    else s == "G"
      s = "C"
    end
  end
new_seq.join
end

puts DNA("ATTA")
puts DNA("CGGC")
puts DNA("ACGTTAGTTA")
