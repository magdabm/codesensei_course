def silnia(n)
  return 1 if n <= 1
  part = silnia(n - 1)
  puts "N: #{n}, part: #{part}"
  part * n
end

puts silnia(15)
