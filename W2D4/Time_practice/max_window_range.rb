def max_windowed_range(array, window_size)
  max_value = array[window_size-1] - array[0]

  array.each_index do |idx|
    break if idx + window_size-1  > array.length - 1
    window = array[idx..idx+window_size-1]
    if (window.max - window.min) > max_value
      max_value = window.max - window.min
    end
  end
  p max_value
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
