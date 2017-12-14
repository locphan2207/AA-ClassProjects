class Array
  def my_each(&prc)
    for idx in 0..(self.length - 1)
      prc.call(self[idx]) # parse value into prc input
    end
  end


  def my_select(&prc)
    arr = []
    my_each  do |val|
      if prc.call(val)
        arr << val
      end
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    my_each  do |val|
      if !prc.call(val)
        arr << val
      end
    end
    arr
  end

  def my_any?(&prc)
    my_each  do |val|
      if prc.call(val)
        return true
      end
    end
    false
  end

  def my_flatten
    arr = []
    self.each_with_index do |val, idx|
      temp = []
      if val.class == Array
        temp = val.my_flatten
        temp.each {|num| arr << num}
      else
        arr << val
      end
    end
    arr
  end

  def my_zip(*more)
    arr = []

    self.each_with_index do |self_val, self_idx|
      new_arr = [self_val]
      more.each do |more_val| #get into each argument
        new_arr << more_val[self_idx]# if more_idx == self_idx
      end

      arr << new_arr
    end

    arr
  end

  def my_rotate(offset = 1)
    offset = offset % self.length

    arr = []

    arr = self[offset..-1] + self[0...offset]


    arr
  end

  def my_join(separator = "")
    result = ""
    self.each_with_index do |char, idx|
      result << char
      result << separator if idx != self.length-1
    end
    result
  end

  def my_reverse
    arr = []
    self.each {|char| arr.unshift(char)}
    arr
  end
end

# arr = [1,2,3,4]
# arr2 = [1,3,5,7,9]
# arr.my_each {|val| puts val}

# puts arr.my_select {|num| num.even?}
# puts arr.my_reject {|num| num.even?}
# puts arr.my_any? {|num| num.even?}
# puts arr2.my_any? {|num| num.even?}
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b)
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse 
