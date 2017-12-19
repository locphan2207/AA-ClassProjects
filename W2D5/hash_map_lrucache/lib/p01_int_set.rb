class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num > @store.length - 1 || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def bucket_num(num)
    num % @store.length
  end

  def insert(num)
    @store[bucket_num(num)] << num
  end

  def remove(num)
    @store[bucket_num(num)].delete(num)
  end

  def include?(num)
    @store[bucket_num(num)].each do |el|
      return true if el == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= @store.length
      resize!
    end
    if !include?(num)
      bucket = num % @store.length
      @store[bucket] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[bucket_num(num)].delete(num)
      @count -= 1
    end
  end

  def bucket_num(num)
    num % @store.length
  end

  def include?(num)
    @store[bucket_num(num)].each do |el|
      return true if el == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(@store.length * 2) { Array.new }
    @store.flatten.each do |el|
      new_array[el % new_array.length] << el
    end
    @store = new_array.dup
  end
end
