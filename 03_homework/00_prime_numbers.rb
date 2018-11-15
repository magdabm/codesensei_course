# Napisz program wyszukujący wszystkie liczby pierwsze z zadanego przedziału jako argumenty wywołania metodą Sita Eratostenesa
# $ ruby sieve_of_eratosthenes.rb 1 10
# Prime numbers: 2, 3, 5, 7


def prime_numbers(range)
   ar = range.to_a
   ar2 = []
   if ar.min == 1
      ar.delete(1)
   else ar.min > 2
      ar2 = (2..ar.min-1).to_a
      ar += ar2
      ar = ar.sort
   end
   i = 2
   while i <= Math.sqrt(ar.max).to_i
      ar.each do |num|
         if num % i == 0
            ar.delete(num) if num != i
         end
      end
      i += 1
   end
   ar - ar2
end

puts prime_numbers(1..10).inspect
puts prime_numbers(4..20).inspect
puts prime_numbers(50..100).inspect


if ARGV.count == 2
   range = (ARGV[0].to_i..ARGV[1].to_i)
   puts prime_numbers(range).inspect
else
   puts "Range should have two numbers."
end
