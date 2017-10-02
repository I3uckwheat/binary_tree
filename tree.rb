class BinaryTree
  attr_reader :root
  def initialize(array)
    @root = build_tree(array)
  end
  class Node
    attr_accessor :parent, :left, :right, :value
    def initialize(value = nil, parent = nil)
      @parent = parent
      @left = nil
      @right = nil
      @value = value
    end
  end

  def build_tree(array)
    root = Node.new(array[0])
    array[1..-1].each do |value|
      new_node = Node.new(value, root)
      place_node(new_node, root)
    end
    root
  end

  def place_node(new_node, parent)
    if new_node.value >= parent.value
      parent.right.nil? ? parent.right = new_node : place_node(new_node, parent.right)
    elsif new_node.value <= parent.value
      parent.left.nil? ? parent.left = new_node : place_node(new_node, parent.left)
    end
  end

  def breadth_first_search(key)
    queue = [@root]
    value = nil
    until queue.empty?
      node = queue.shift
      value = node if node.value == key
      queue << node.right unless node.right.nil?
      queue << node.left unless node.left.nil?
    end
    value
  end

  def depth_first_search; end

  def dfs_rec; end
end

# array_of_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# build_tree(array_of_data)

# repl.it https://repl.it/LqAws/2
