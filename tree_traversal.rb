# This has not been tested at all.

module Traversal
  # Will return the first Node where node.value == value.
  def search_for(value, method = :breadth_first)
    traversal_methods = [:breadth_first, :depth_first, :pre_order, :post_order]
    if traversal_methods.include? method
      self.send(method, value)
    else
      self.method_missing(method)
    end
  end

  def pre_order(value)
    return nil if self.root.nil?
    return self.root if self.root.value == value
    self.branches.each do |branch|
      in_branch = branch.pre_order(value)
      return in_branch if in_branch
    end
    return nil
  end
  alias :depth_first :pre_order

  def post_order(value)
    return nil if self.root.nil?
    self.branches.each do |branch|
      in_branch = branch.pre_order(value)
      return in_branch if in_branch
    end
    return self.root if self.root.value == value
    return nil
  end

  def breadth_first(value)
    return nil if self.root.nil?
    return self.root if self.root.value == value
    untraversed_branches = self.branches
    while !untraversed_branches.empty?
      untraversed_branches.each do |branch|
        return branch.root if branch.root.value == value
      end
      untraversed_branches.map! do |branch|
        branch.branches
      end
      untraversed_branches.flatten!.compact!
    end
    return nil
  end

end
