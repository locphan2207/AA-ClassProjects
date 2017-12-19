require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    resize! if @count >= num_buckets
      
    new_item = [key, val]
    if include?(key)
      @store[bucket(key)].update(key, val)
    else
      @store[bucket(key)].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    @store[bucket(key)].remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |bucket| 
      next if bucket.empty?
      prc.call(bucket.first.key, bucket.first.val)
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { LinkedList.new }
    each do |key, val|
      if new_store[key.hash % new_store.length].include?(key)
        new_store[key.hash % new_store.length].update(key, val)
      else
        new_store[key.hash % new_store.length].append(key, val)
      end
    end
    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % @store.length
  end
end
