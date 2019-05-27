
def bubble_sort(array)
  array.each do |element|
    array.each_with_index do |element, index|
      if index > 0 && element < array[index-1]
        substitute = array[index-1]
        array[index-1] = element
        array[index] = substitute
      end
    end
  end
  return array
end

puts bubble_sort([4,3,78,2,0,2])

# [0,2,2,3,4,78]
