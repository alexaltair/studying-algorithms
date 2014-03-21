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
