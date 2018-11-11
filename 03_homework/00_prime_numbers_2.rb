# Napisz program wyszukujący wszystkie liczby pierwsze z zadanego przedziału jako argumenty wywołania metodą Sita Eratostenesa
# $ ruby sieve_of_eratosthenes.rb 1 10
# Prime numbers: 2, 3, 5, 7

def missing(range)
   ar2 = (2..range.min-1).to_a
end

def normalize_range(range)   # jeżeli zadany zakres zaczyna się od 3 lub więcej, ta metoda dodaje do zadanego zakresu "brakujące" liczby od 2, żeby później wykonać metodę znajdowania liczb pierwszych (która działa na zakresie od 1) oraz przekształca zakres w tabelę
   ar = range.to_a
   if ar.min == 1
      ar.delete(1)
   else ar.min > 2
      ar += missing(range)
      ar = ar.sort
   end
   ar
end

def find_prime(ar)   # meotoda znajdująca liczby pierwsze
   i = 2
   while i <= Math.sqrt(ar.max).to_i
      ar.each do |num|
         if num % i == 0
            ar.delete(num) if num != i
         end
      end
      i += 1
   end
   ar
end

def clean_after_normalize(range, ar)
   ar -= missing(range)
end

def prime_numbers(range)
   clean_after_normalize(range, find_prime(normalize_range(range)))
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
