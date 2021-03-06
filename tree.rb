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
    until queue.empty? || !value.nil?
      node = queue.shift
      value = node if node.value == key
      queue << node.right unless node.right.nil?
      queue << node.left unless node.left.nil?
    end
    value
  end

  def depth_first_search(key)
    stack = [@root]
    value = nil
    until stack.empty? || !value.nil?
      node = stack.pop
      value = node if node.value == key
      stack << node.right unless node.right.nil?
      stack << node.left unless node.left.nil?
    end
    value
  end

  def dfs_rec(key, node = @root)
    return if node.nil?
    left = dfs_rec(key, node.left)
    return node if node.value == key
    right = dfs_rec(key, node.right)
    left || right
  end
end

# array_of_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# build_tree(array_of_data)

# repl.it https://repl.it/LqAws/2
# ([5, 4, 6, 3, 7, 2, 7])
