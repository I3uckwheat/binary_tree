class Node
  attr_accessor :parent, :children, :value
  def initialize(parent = nil, children = nil, _value = nil)
    @parent = parent
    @children = children
    @value = nil
  end
end

def build_tree; end

def breadth_first_search; end

def depth_first_search; end

def dfs_rec; end
