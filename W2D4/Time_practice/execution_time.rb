

# def my_min(array)
#   smallest = array[0]
#   array.each_index do |i|
#     array.each_index do |j|
#       next if i == j
#       if array[j] < smallest
#         smallest = array[j]
#       end
#     end
#   end
#   smallest
# end


def my_min(array)
  smallest = array[0]
  array.each_index do |i|
    if array[i] < smallest
      smallest = array[i]
    end
  end
  smallest
end

def contiguous_subset(array)
  subsets = []
  array.each_index do |idx1|
    subsets << [array[idx1]]
    array[idx1+1..-1].each_index do |idx2|
      subsets << array[idx1..idx2+idx1+1]
    end
  end
  subsets
end

def largest_sum(array)
  subsets = contiguous_subset(array)
  reduced_subsets = subsets.map do |sum|
     sum.reduce(:+)
  end
  reduced_subsets
end



def largest_sum2(array)
  total_sum = 0
  largest_sum = 0
  array.each do |num|
    total_sum += num
    largest_sum = total_sum if total_sum > largest_sum
  end
  largest_sum
end
