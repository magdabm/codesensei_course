# Napisz program rysujący tekstową choinkę w konsoli. Na przykład taką:

def draw_segment(from, to, padding = 0)
  print "\033[0;32m"
  (from..to).each do |i|
    print " " * ((to - i) + padding)
    print "*" * ((i * 2) - 1)
    print "\n"
  end
end

draw_segment(1, 4, 2)
draw_segment(2, 6)
draw_segment(1, 1, 5)
