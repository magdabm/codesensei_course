["a", "bb", "ccc"].inject(0) do |accumulator, element|
  accumulator + element.length
end

# accumulator - zmienna do przechowywania wartości w każdym kroku, w tym przypadku sumy, która zwiększa się po dodaniu każdego kolejnego elementu
