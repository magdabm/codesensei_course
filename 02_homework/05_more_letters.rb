# Napisz funkcję accum, która działa w następujący sposób:
# accum("abcd") #=> "A-Bb-Ccc-Dddd"
# accum("RqaEzty") #=> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# accum("cwAt") #=> "C-Ww-Aaa-Tttt"


def accum(text)
  text = text.chars
  i = 0
  new_text = ""
  while i < text.length
    text[i] = (text[i] * (i+1)).capitalize
    new_text += text[i] + "-"
    i += 1
  end
  new_text = new_text.chars   # zmiana na tablicę, aby można było usunąć ostatni element
  temp_text = new_text.delete_at(-1)   # metoda usuwająca ost. element, zwracająca ten element
  new_text.join  # to co zostało po usunięciu
end

puts accum("abcd")
puts accum("RqaEzty")
puts accum("cwAt")


# lub: /z Google :)/

def accum2(s)
  s.chars.each_with_index.map do |c, i|
    c.upcase + c.downcase * i
  end.join('-')
end

puts accum2("mtb")
