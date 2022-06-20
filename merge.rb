def merge_sort(array)
  if array.length < 2
    array
  else
    midpoint = (array.length / 2) # Integer division will floor
    # split the array in about 2 equal parts
    left = merge_sort(array[0..midpoint - 1])
    right = merge_sort(array[midpoint..array.length])
    # final step of merge sort, merge the left and right halves together
    merge(left, right)
  end
end

# the actual merging operation 
def merge(left, right)
  if left.empty? #catching empty arrays
    right
  elsif right.empty?
    left
  elsif left.first < right.first # first element of the left array being smaller
    [left.first] + merge(left[1..left.length], right)
  else # first element of the left array being bigger
    [right.first] + merge(left, right[1..right.length])
  end
end

# Test the algorithm
test_array = Array.new(10) {rand(1..100)}
p test_array
p merge_sort(test_array)