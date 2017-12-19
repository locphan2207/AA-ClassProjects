class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next 
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @first = Node.new
    @last = Node.new
    @first.next = @last
    @last.prev = @first
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @first.next
  end

  def last
    @last.prev
  end

  def empty?
   @first.next == @last && @last.prev == @first
  end

  def get(key)
    current_node = first 
    while current_node != @last
      return current_node.val if current_node.key == key 
      current_node = current_node.next 
    end
    nil
  end

  def include?(key)
    current_node = first 
    while current_node != @last
      return true if current_node.key == key 
      current_node = current_node.next 
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @last.prev.next = new_node
    new_node.prev = @last.prev
    new_node.next = @last
    @last.prev = new_node
  end

  def update(key, val)
    current_node = first 
    while current_node != @last
      current_node.val = val if current_node.key == key 
      current_node = current_node.next 
    end
  end

  def remove(key)
    current_node = first 
    while current_node != @last
      current_node.remove if current_node.key == key 
      current_node = current_node.next 
    end
  end

  def each(&prc)
    current_node = first 
    while current_node != @last
      prc.call(current_node)
      current_node = current_node.next 
    end
  end
  

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
