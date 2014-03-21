class Node
  attr_accessor :data, :children, :tree

  def initialize(data = nil, children = [])
    @data = data
    @children = children
    @children.map! do |child|
      if child.is_a? Node
        child
      elsif child.is_a? Tree
        child.root
      else
        Node.new(child)
      end
    end
  end

  def inspect
    string =    "#<Node: @data=#{self.data.inspect},"
    if self.children.length < 2
      string << " @children=#{self.children.inspect}>"
    else
      string << "\n  @children=[\n"
      self.children.each do |child|
        string << "    #{child.inspect}\n"
      end
      string << "  ]\n"
      string << ">"
    end
    string
  end

  def to_tree(parent = nil)
    Tree.new(self, parent)
  end

  def parent
    self.tree.parent.root
  end

  def height
    if self.children.empty?
      0
    else
      self.children.map(&:height).max + 1
    end
  end

  def depth
    depth = 0
    parent = self.parent
    while parent != nil
      parent = parent.parent
      depth += 1
    end
    depth
  end

end


class Tree
  attr_reader :root, :branches
  alias :forest :branches

  def initialize(root = nil, parent = nil, branches = [])
    @root = root
    @parent = parent
    @branches = []

    unless root.nil?
      if root.children.empty?
        @branches.concat(branches)
      else
        root.children.each do |child|
          @branches << Tree.new(child, self)
        end
      end
    end
  end

  # Broken.
  def inspect
    string =    "#<Tree: @root=#{self.root.data.inspect},"
    if self.branches.length < 2
      string << " @branches=#{self.branches.inspect}>"
    else
      string << "\n  @branches=[\n"
      self.branches.each do |branch|
        string << "    #{branch.root.data.inspect}\n"
      end
      string << "  ]\n"
      string << ">"
    end
    string
  end

  def [](branch)
    self.branches[branch]
  end

  def []=(branch, tree)
    self.branches[branch] = tree
  end

  def max_depth
  end

  # Returns an array of nodes.
  def leaves
  end

  def empty?
    self.root == nil
  end

  def highest_ancestor
  end

  def to_a
  end

end
