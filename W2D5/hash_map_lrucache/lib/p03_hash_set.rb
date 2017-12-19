require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def bucket_num(item)
    item.hash % @store.length
  end

  def insert(item)
    if @count >= @store.length
      resize!
    end
    if !include?(item)
      @store[bucket_num(item)] << item
      @count += 1
    end
  end

  def include?(item)
    @store[bucket_num(item)].each do |el|
      return true if el == item
    end
    false
  end

  def remove(item)
    if include?(item)
      @store[bucket_num(item)].delete(item)
      @count -= 1
    end
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
