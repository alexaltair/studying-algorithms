module Traversal
  TRAVERSAL_ALGORITHMS = [
    :breadth_first,
    :depth_first,
    :pre_order,
    :post_order,
  ]

  # Will return the first Node where node.value == value.
  def search_for(value, method = :breadth_first)
    if TRAVERSAL_ALGORITHMS.include? method
      self.send(method, value)
    else
      self.method_missing(method)
    end
  end

  def pre_order(value)
    return self if self.root == value
    self.branches.each do |branch|
      in_branch = branch.pre_order(value)
      return in_branch if in_branch
    end
    return nil
  end
  alias :depth_first :pre_order

  def post_order(value)
    self.branches.each do |branch|
      in_branch = branch.post_order(value)
      return in_branch if in_branch
    end
    return self if self.root == value
    return nil
  end

  def breadth_first(value)
    return self if self.root == value
    untraversed_branches = Array.new(self.branches)
    while !untraversed_branches.empty?
      untraversed_branches.each do |branch|
        return branch if branch.root == value
      end
      untraversed_branches.map! do |branch|
        branch.branches
      end
      untraversed_branches.flatten!.compact!
    end
    return nil
  end

end
