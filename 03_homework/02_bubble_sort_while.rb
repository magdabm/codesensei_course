# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą sortowania bąbelkowego
# $ ruby bubble_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97


def argv_prepare(numbers)   # zamiana elementów tablicy na liczby
   numbers.map do |e|
      e.to_i
   end
end

def bubble_sort(numbers)
   array = argv_prepare(numbers)
   i = 1
   while i < array.count
      j = 0
      while j < array.count - 1
         if array[j] > array[j+1]
            z = array[j]
            array[j] = array[j+1]
            array[j+1] = z
         else
            j += 1
            next
         end
         j += 1
      end
      i += 1
   end
   array
end


if ARGV.count >= 2
   numbers = ARGV
   puts bubble_sort(numbers).inspect
else
   puts "Numbers should be more than 1."
end
