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
  right = nil
  left = nil
  array.each do |value|
    parent = root
    placed = false
    new_node = Node.new(value, parent, left, right)
    until placed
      if new_node.value <= parent.value
        if parent.right.nil?
          parent.right = new_node
          placed = true
        else
          parent = parent.right
        end
      elsif new_node.value >= parent.value
        if parent.left.nil?
          parent.left = new_node
          placed = true
        else
          parent = parent.left
        end
      end
    end
  end
  root
end

def breadth_first_search; end

def depth_first_search; end

def dfs_rec; end

#array_of_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

#build_tree(array_of_data)

test_ary = [5, 7, 3, 2, 6, 4, 16]