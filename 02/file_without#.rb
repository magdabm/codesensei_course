
file = File.open("/etc/hosts")
file.each do |line|
  next if line[0] == "#"
  puts line
end
