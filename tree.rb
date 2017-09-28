class Node
  attr_accessor :parent, :left, :right, :value
  def initialize(value = nil, parent = nil, left = nil, right = nil)
    @parent = parent
    @left = left
    @right = right
    @value = value
  end
end

def build_tree(array)
  root = Node.new(array.shift)
  parent = root
  right = nil
  left = nil
  array.each do |value|
    new_node = Node.new(value, parent, left, right)
    parent.right = new_node
    parent = new_node
  end
  root
end

def breadth_first_search; end

def depth_first_search; end

def dfs_rec; end

array_of_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# build_tree(array_of_data)
