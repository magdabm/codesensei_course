# Napisz program wyszukujący wszystkie liczby pierwsze z zadanego przedziału jako argumenty wywołania metodą Sita Eratostenesa
# $ ruby sieve_of_eratosthenes.rb 1 10
# Prime numbers: 2, 3, 5, 7


def prime_numbers(range)
   ar = range.to_a
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
   prime = []
   ar.map do |e|
      prime << e if ar2[e] == true
   end
   prime
end


# puts prime_numbers(1..10).inspect


if ARGV.count == 2
   range = (ARGV[0].to_i..ARGV[1].to_i)
   puts prime_numbers(range)
else
   puts "Range should have two numbers."
end
