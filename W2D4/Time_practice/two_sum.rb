def bad_two_sum?(arr,target)
  arr.each do |num1|
    arr.each do |num2|
      next if num1 == num2
      return true if num1 + num2 == target
    end
  end
  false
end

def binary_search(arr,target)
  return nil if arr.length == 0

  middle = arr.length / 2
  case target <=> arr[middle]
  when -1
    binary_search(arr[0...middle], target)
  when 0
    arr[middle]
  when 1
    binary_search(arr[middle+1..-1], target)
  end
end

def okay_two_sum?(arr,target)
  arr = arr.sort
  arr.each_with_index do |num,idx|
    new_target = target - num
    next if new_target == arr[idx]
      if binary_search(arr, new_target) != nil
        return true
      end
    end
  false
end



def two_sum?(arr,target)
  new_hash = Hash.new
  arr.each do |num|
    if !new_hash.has_key?(num)
      new_hash[target-num] = num
    else
      return true
    end
  end
  false
end



p bad_two_sum?([0, 1, 5, 7], 6) # => should be true
p bad_two_sum?([0, 1, 5, 7], 10) # => should be false

p okay_two_sum?([0, 1, 5, 7], 6) # => should be true
p okay_two_sum?([0, 1, 5, 7], 10) # => should be false

p two_sum?([0, 1, 5, 7], 6) # => should be true
p two_sum?([0, 1, 5, 7], 10) # => should be false
