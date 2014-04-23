class Tree
  include Enumerable
  include Traversal

  attr_accessor :root

  # def branches=(val)

  # end

  attr_reader :branches
  attr_reader :parent
  alias :forest   :branches
  alias :children :branches

  def initialize(root = nil, branches = [])
    @root = root
    @branches =
      if branches.respond_to?(:keys) && branches.respond_to?(:values)
        branches.map{ |k, v| Tree.new k, v }
      elsif branches.respond_to? :map
        branches.map do |branch|
          if branch.is_a? Tree
            branch
          else
            Tree.new branch
          end
        end
      else
        []
      end

  end

  # Broken.
  # def inspect
  #   string =    "\n#<Tree: @root=#{self.root.inspect},"
  #   if self.branches.length < 2
  #     string << " @branches=#{self.branches.inspect}>"
  #   else
  #     string << "\n  @branches=[\n"
  #     self.branches.each do |branch|
  #       string << "    #{branch.root.inspect}\n"
  #     end
  #     string << "  ]\n"
  #     string << ">"
  #   end
  #   string
  # end

  def [](branch)
    self.branches[branch]
  end

  def []=(branch, tree)
    self.branches[branch] = tree
  end

  def size
    1 + self.branches.map(&:size).inject(0, &:+)
  end
  alias :count :size

  def max_depth
  end

  def leaf?
    self.branches.empty?
  end

  def empty?
    self.root.nil? && self.leaf?
  end

  def leaves
    self.select{|tree| tree.branches.empty?}.map(&:root)
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

  def ancestors
    current = self
    ancestors = []
    while current.parent
      current = current.parent
      ancestors << current
    end
    ancestors
  end

  def highest_ancestor
    ancestor = self
    while ancestor.parent
      ancestor = ancestor.parent
    end
    ancestor
  end

  def values
    self.map(&:root)
  end

  # This is probably wrong.
  def to_a
    array = [self.root]
    self.branches.each do |branch|
      array + branch.to_a
    end
    array
  end

  def to_hash
  end

end
