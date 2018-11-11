# Napisz program wyszukujący wszystkie liczby pierwsze z zadanego przedziału jako argumenty wywołania metodą Sita Eratostenesa
# $ ruby sieve_of_eratosthenes.rb 1 10
# Prime numbers: 2, 3, 5, 7



def normalize_range(range)
   ar = range.to_a
   if ar.min > 2   # normalizacja zadanego zakresu aby zawsze zakres zaczynał się od 2
      ar += (2..ar.min-1).to_a
      ar = ar.sort
   else
      ar.delete_if { |e| e < 2 }
   end
   ar
end


def prime_numbers(range)
   ar = normalize_range(range)
   ar2 = [nil, nil] + [true] * ar.size

   i = 2
   while i <= Math.sqrt(ar.max).to_i
      if ar2[i]
         z = i * i
         while z <= ar.max
            ar2[z] = false
            z += i
         end
      end
      i += 1
   end

   ar.delete_if { |e| e < range.min }
   ar.delete_if { |e| ar2[e] == false }
end


puts prime_numbers(1..10).inspect
puts prime_numbers(4..20).inspect
puts prime_numbers(50..100).inspect


if ARGV.count == 2
   range = (ARGV[0].to_i..ARGV[1].to_i)
   puts prime_numbers(range)
else
   puts "Range should have two numbers."
end
