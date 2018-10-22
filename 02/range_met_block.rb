def range(from, to)
  while from < to
    yield from
    from = from + 1
  end
end

range(7, 18) do |i|
  puts i if i % 2 == 1
end

# to to samo co:

(7..18).each { |n| puts n if n % 2 == 1 }

# to to samo co:

i = 7
while i < 18
  puts i if i % 2 == 1
  i += 1
end
