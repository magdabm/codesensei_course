
def writer
  result = yield
  puts "He said: #{result}"
end

writer { "a text" }

# tak samo jak:
# writer do
#  "a text"
# end
