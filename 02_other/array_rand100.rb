
arr_100 = Array.new(10) { rand(100) }    # tak samo jak: do |i| rand(100) end

puts arr_100.inspect
puts
"\n"

arr_grouped = arr_100.group_by { |i| i%10 }    # tak samo jak: do |i| i%10 end

puts arr_grouped
puts

arr_trans = arr_grouped.transform_values { |i| i.length }

puts arr_trans
puts
