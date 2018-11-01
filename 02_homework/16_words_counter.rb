# Napisz program, który policzy ilość wystąpień poszczególnych słów w zadanym jako argument stringu. Zignoruj wielkość liter. Np:
# word_count('foo Foo bar bar Bar') #=> { "foo" => 2, "bar" => 3 }
# word_count('Losowy ciąg znaków ciąg') #=> { "losowy" => 1, "ciąg" => 2, "znaków" => 1 }



def word_count(text)
  text_array = text.downcase.split
  words = {}
  text_array.each do |word|
    words[word] = words[word].to_i + 1
  end
words
end

puts word_count('foo Foo bar bar Bar')
puts word_count('Losowy ciąg znaków ciąg')
