require "./tree_traversal.rb"

class Tree
  include Traversal

  attr_reader :root, :branches, :parent
  alias :forest   :branches
  alias :children :branches

  def initialize(root = nil, branches = [])
    @root = root
    @branches =
      branches.map do |branch|
        if branch.is_a? Tree
          branch
        else
          branch = Tree.new(branch)
          branch.instance_variable_set(:@parent, self)
          branch
        end
      end

  end

  # Broken.
  def inspect
    string =    "#<Tree: @root=#{self.root.inspect},"
    if self.branches.length < 2
      string << " @branches=#{self.branches.inspect}>"
    else
      string << "\n  @branches=[\n"
      self.branches.each do |branch|
        string << "    #{branch.root.inspect}\n"
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

  def size
  end
  alias :count :size

  def max_depth
  end

  # Returns an array of nodes.
  def leaves
  end

  def empty?
    self.root == nil
  end

  def height
    if self.branches.empty?
      0
    else
      self.branches.map(&:height).max + 1
    end
  end

  def depth(ancestor_tree = nil)
    depth = 0
    ancestor = self.parent
    while ancestor != ancestor_tree
      ancestor = ancestor.parent
      depth += 1
    end
    depth
  end

  def highest_ancestor
    ancestor = self
    while ancestor.parent
      ancestor = ancestor.parent
    end
    ancestor
  end

  def to_a
    array = [self.root]
    self.branches.each do |branch|
      array + branch.to_a
    end
    array
  end

end



class Object
  def to_tree(branches = [])
    Tree.new(self, branches)
  end
end

class Array
  def to_branches
    self.map(&:to_tree)
  end
  alias :to_tree :to_branches
end

class Hash
  def to_branches
    self.map do |k, v|
      Tree.new(k, [*v.to_tree])
    end
  end
  alias :to_tree :to_branches
end
