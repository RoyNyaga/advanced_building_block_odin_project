def bubble_sort_by(array)
  array.each do |element|
    array.each_with_index do |element, index|
      if index > 0
        result = yield(array[index-1], element)
        if result > 0 # positive result => value on the left is greater
          # wsapping elements if results is positive
          array[index-1], array[index] = element, array[index-1]
        end
      end
    end
  end
  return array
end

my_array = ["goingto", "hello", "hey", "hi"]
bubble_sort_by(my_array) do |left, right|
  left.length - right.length
end

p my_array
