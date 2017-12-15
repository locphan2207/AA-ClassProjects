def remove_dups(array)
  new_array = []
  array.each do |ch|
    new_array << ch unless new_array.include?(ch)
  end
  new_array
end

def two_sum(array)
  pairs = []

  array.each_index do |i_idx|
    array.each_index do |j_idx|
      if array[i_idx] + array[j_idx] == 0
        pairs << [i_idx, j_idx] unless i_idx == j_idx || pairs.include?([j_idx, i_idx])
      end
    end
  end

  pairs
end

def my_transpose(array)
  results = Array.new
  holding = Array.new

  i = 0
  while i < array.length
    results[i] = []
    j = 0
    while j < array.length
      results[i] << array[j][i]
      j += 1
    end
    i += 1
  end
  results
end

def stock_picker(array)
  result = []
  highest_price = 0
  array.each_index do |i_index|
    array.each_index do |j_index|
      next if j_index <= i_index
      profit = array[j_index] - array[i_index]
      if profit > highest_price
        highest_price = profit
        result = [i_index,j_index]
      end
    end
  end
  result
end
