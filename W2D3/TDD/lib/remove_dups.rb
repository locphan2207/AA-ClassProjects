def my_uniq(array)
  result = []
  array.each {|el| result << el unless result.include?(el)}
  result
end
