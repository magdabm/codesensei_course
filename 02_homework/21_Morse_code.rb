# Kod Morse’a – stworzony w 1838 przez Samuela Morse’a i Alfreda Vaila sposób reprezentacji alfabetu, cyfr i znaków specjalnych za pomocą dźwięków, błysków światła, impulsów elektrycznych lub znaków popularnie zwanych kreską i kropką.(Wikipedia)
# Wszystkie znaki reprezentowane są przez kilkuelementowe serie sygnałów – krótkich (kropek) i długich (kresek). Przykładowo literę a kodujemy za pomocą “.-”.
# Zadanie polega na napisaniu funkcji decode_morse, która dla otrzymanego kodu, zwróci jego odszyfrowaną wersję. Przykładowo: decode_morse('.... . .-.. .-.. --- .-- --- .-. .-.. -..') #=> "HELLOWORLD"

MORSE_CODE = { ".-" => "a", "-..." => "b",	"-.-." => "c",
              "-.." => "d", "." => "e", "..-." => "f",
              "--." => "g", "...." => "h", ".." => "i",
              ".---" =>  "j", "-.-" => "k", ".-.." => "l",
              "--" => "m", "-." => "n", "---" => "o",
              ".--." => "p", "--.-" => "q", ".-." => "r",
              "..." => "s", "-" => "t", "..-" => "u",
              "...-" => "v", ".--" =>  "w", "-..-" =>  "x",
              "-.--" => "y", "--.." => "z", " " => " ",
              ".----" => "1", "..---" => "2", "...--" => "3",
              "....-" => "4", "....." => "5", "-...." => "6",
              "--..." => "7", "---.." => "8", "----." => "9",
              "-----" => "0"}

def decode_morse(code)
  code = code.split
  text = ""
  code.each do |elem|
    text += MORSE_CODE[elem]
  end
text.upcase
end

puts decode_morse('.... . .-.. .-.. --- .-- --- .-. .-.. -..')
