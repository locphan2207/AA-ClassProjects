class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    (0..self.length-1).each do |i|
      result = result ^ (self[i].hash * i.hash)
    end
    result
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    hash = Hash.new(0)
    alphabet.each_with_index { |letter, idx| hash[letter] = idx + 1}

    result = 0
    self.chars.each_with_index do |char, idx|
      result = result ^ (hash[char].hash * idx.hash)
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |key, value|
      result = result ^ (key.hash ^ value.hash)
    end
    result
  end
end
