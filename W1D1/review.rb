def factors(num)
  (1..num).select {|val| num % val == 0}
end

class Array

  def bubblesort!(&prc)
    stop = self.length - 1

    while stop >= 0
      self.each_with_index do |val, idx|
        if idx == stop
          stop -=1
          break
        end

        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
        end
      end
    end
    self
  end

  # def bubblesort!
  #   stop = self.length - 1
  #
  #   while stop >= 0
  #     self.each_with_index do |val, idx|
  #       if idx == stop
  #         stop -=1
  #         break
  #       end
  #
  #       if self[idx] > self[idx + 1]
  #         self[idx], self[idx + 1] = self[idx + 1], self[idx]
  #       end
  #     end
  #   end
  #   self
  # end

  # def bubblesort!
  #   sorted = false
  #
  #   while !sorted
  #     sorted = true
  #     self.each_index do |idx|
  #       next if idx == self.length - 1
  #       if self[idx] > self[idx + 1]
  #         self[idx], self[idx + 1] = self[idx + 1], self[idx]
  #         sorted = false
  #       end
  #     end
  #   end
  #   self
  # end

  def bubblesort
    arr = self.dup
    arr.bubblesort!
  end



end

# def substrings(string)
#   arr = []
#
#   for i in 0..string.length - 1
#     substring = string[i]
#     arr << substring
#     for j in i + 1..string.length - 1
#       substring += string[j]
#       arr << substring
#     end
#   end
#   arr
# end

def substrings(string)
  arr = []
  string.chars.each_with_index do |ch, idx|
    j = idx
    while j < string.length
      arr << string[idx..j]
      j += 1
    end
  end

  arr
end

def subwords(word, dictionary)
  arr = substrings(word)
  arr.select {|val| dictionary.include?(val)}
end
# arr = [7,2,0,5,38,39,22,2,1]

# p arr.bubblesort!
# arr2 = arr.bubblesort
# p arr
# p arr2

# p arr.bubblesort! { |num1, num2| num1 <=> num2 }
# p arr.bubblesort! { |num1, num2| num2 <=> num1 }

p substrings("cat")
p subwords("cat", ['a', 'at', 'cat', 'house', 'dogs'])
