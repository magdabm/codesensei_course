# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą sortowania bąbelkowego
# $ ruby bubble_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97

def argv_prepare(numbers)   # zamiana elementów tablicy na liczby
   numbers.map do |e|
      e.to_i
   end
end

def bubble_sort(numbers)
   array = argv_prepare(numbers)
   repetition = array.count - 1 # -1, bo np. dla 5 elementowej tablicy porównań będzie 4
   repetition.times do
      array[0...-1].each_with_index.map do |e, index|   # zapis [0...-1] redukuje tablicę o 0 elementów z lewej i ostatni element z prawej strony, usuwamy ostatni element żeby nie doszło do powrównania ostatniego elementu z nil (w przeciwnym razie error)
         if array[index] > array[index+1]
            z = array[index]
            array[index] = array[index+1]
            array[index+1] = z
         else
            next
         end
      end
   end
   array
end

# puts bubble_sort([9, 1, 7, 2, 27, 3, 4])

if ARGV.count >= 2
   numbers = ARGV
   puts bubble_sort(numbers).inspect
else
   puts "Numbers should be more than 1."
end
