# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą quick sort
# $ ruby quick_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79
# 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97


def argv_prepare(numbers)   # zamiana elementów tablicy na liczby
   numbers.map do |e|
      e.to_i
   end
end

def sort(ar, left, right)
   if left < right
      pivot = ar[right]
      j = left
      indicator = left
      while j < right
         if ar[j] < pivot
            swap(ar, j, indicator)
            indicator += 1
         end
         j += 1
      end
      swap(ar, indicator, right)
      sort(ar, left, indicator - 1)
      sort(ar, indicator + 1, right)
   end
   ar
end

def swap(array, ind1, ind2)
   t = array[ind1]
   array[ind1] = array[ind2]
   array[ind2] = t
end

puts sort([7, 2, 4, 7, 3, 1, 4, 6, 5, 8, 3, 23, 9, 2, 6, 7, 6, 5],0,17).inspect

if ARGV.count >= 2
   numbers = ARGV
   puts sort(argv_prepare(numbers), 0, ARGV.size - 1).inspect
else
   puts "Numbers should be more than 1."
end
