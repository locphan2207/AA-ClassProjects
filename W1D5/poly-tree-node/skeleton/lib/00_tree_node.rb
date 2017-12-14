require 'byebug'
class PolyTreeNode
  attr_accessor :parent, :children, :value, :queue

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(parent_node)
    unless parent_node.nil?
      @parent.children.delete(self) unless @parent.nil?
      unless parent_node.children.include?(self)
        parent_node.children << self
      end
    end
    @parent = parent_node
  end

  def add_child(child_node)
    @children << child_node unless @children.include? child_node
    child_node.parent = self
  end

  def remove_child(child_node)
    if @children.include? child_node
      @children.delete(child_node)
      child_node.parent = nil
    else
      raise "No child node!"
    end
  end

  def to_s
    @value
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue.push(self)
    until queue.empty?
      first_node = queue.shift
      return first_node if first_node.value == target_value
      first_node.children.each { |child| queue.push(child) }
    end
    nil
  end
end

class Queue
  def initialize
    @inner_array = []
  end

  def enqueue(el)
    @inner_array.unshift(el)
  end

  def dequeue
    @inner_array.pop
  end

  def empty?
    @inner_array.empty?
  end
end
