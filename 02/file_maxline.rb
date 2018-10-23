
file = File.open("/etc/hosts")

max = ""
file.each do |line|
  if line.length > max.length
  max = line
  end
end
file.close

puts max



# data = File.open("/etc/hosts") { |f| f.map { |line| line.reverse } }
# to to samo co:
data = File.open("/etc/hosts") do |f|
  f.map do |line|
    line.reverse
  end
end

puts data
