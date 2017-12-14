def range(start, dest)
  return [] if dest < start
  return [start] if start == dest - 1

  [start] + range(start + 1, dest)
end

def rec_sum(arr)
  return 0 if arr.empty?
  return arr.first if arr.length == 1

  arr.first + rec_sum(arr[1..-1])
end

def it_sum(arr)
  arr.reduce(:+)
end
$count = 0
def ex_1(base, pow)
  return 1 if pow == 0
  $count +=1
  base * ex_1(base, pow - 1)
end

def ex_2(base, pow)
  p "Base: #{base}"
  p "Pow: #{pow}"
  return 1 if pow == 0
  return base if pow == 1

  if pow.even?
    $count +=1
    even = ex_2(base, pow / 2)
    even * even
  else
    $count +=1
    odd = ex_2(base, (pow - 1) / 2)
    base * odd * odd
  end
end

class Array
  def deep_dup
    result = []

    self.each do |ele|
      if ele.is_a?(Array)
        result << ele.deep_dup
      else
        result << ele
      end
    end

    result
  end

  def subsets
    return [[]] if self.empty?
    return [[], self] if self.length == 1

    old_seq = self[0..-2].subsets
    old_seq + old_seq.map { |el| el + [self[-1]]  }
  end

  def my_permutation
    return self if self.length <= 1
    result = []
    self.each_with_index do |ele, idx1|
      rest = []
      self.each_with_index{ |ele2, idx2| rest << ele2 if idx1 != idx2 }
      rest.my_permutation.each {|perm| result << [ele, perm].flatten}
    end
    result
  end
end

def fib_seq(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  old_seq = fib_seq(n - 1)
  new_val = old_seq[-2] + old_seq[-1]
  old_seq + [new_val]
end

def bsearch(array, target)
  return nil if array.empty?
  mid_idx = array.length / 2

  if array[mid_idx] == target
    mid_idx
  elsif array[mid_idx] > target
    bsearch(array[0...mid_idx], target)
  elsif array[mid_idx] < target
    right_side = bsearch(array[(mid_idx + 1)..-1], target)
    return nil if right_side == nil
    right_side + 1 + mid_idx
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid_idx = arr.length / 2
  p "MIDIDX IS #{mid_idx}"
  p "LEFT: #{arr[0...mid_idx]}"
  p "RIGHT: #{arr[mid_idx..-1]}"


  merge(merge_sort(arr[0...mid_idx]), merge_sort(arr[mid_idx..-1]))
end

def merge(left_arr, right_arr)
  #handling when left arr == right Array
  # return left_arr if left_arr == right_arr
  result = []

  left_idx = 0
  right_idx = 0

  while true
    if left_idx >= left_arr.length
      result += right_arr[right_idx..-1]
      break
    end

    if right_idx >= right_arr.length
      result += left_arr[left_idx..-1]
      break
    end

    if left_arr[left_idx] < right_arr[right_idx]
      result << left_arr[left_idx]
      left_idx += 1
    elsif left_arr[left_idx] > right_arr[right_idx]
      result << right_arr[right_idx]
      right_idx += 1
    else
      result.push(left_right[left_idx], right_arr[right_idx])
      left_idx += 1
      right_idx += 1
    end
  end

  result
end

def greedy_make_change(value, coins = [25, 10, 5, 1])
  return [] if value == 0

  if coins.first <= value
    greedy_make_change(value - coins.first, coins).unshift(coins.first)
  else
    greedy_make_change(value, coins[1..-1])
  end
end

def make_better_change(value, coins = [25, 10, 5, 1])
  return [] if value == 0

  if coins.first <= value
    greedy_make_change(value - coins.first, coins).unshift(coins.first)
  else
    greedy_make_change(value, coins[1..-1])
  end
end
