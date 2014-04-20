module Traversal
  TRAVERSAL_ALGORITHMS = [
    :breadth_first,
    :depth_first,
    :pre_order,
    :post_order,
  ]

  def search_for(value, algorithm = :pre_order)
    self.each(algorithm) do |tree|
      return tree if tree.root == value
    end
    return nil
  end

  def each(algorithm = :pre_order, &block)
    if TRAVERSAL_ALGORITHMS.include? algorithm
      self.send(algorithm, &block)
    else
      self.method_missing(algorithm)
    end
  end

  def pre_order(&block)
    yield self
    self.branches.each do |branch|
      branch.pre_order(&block)
    end
  end
  alias :depth_first :pre_order

  def post_order(&block)
    self.branches.each do |branch|
      branch.post_order(&block)
    end
    yield self
  end

  def breadth_first(&block)
    yield self
    untraversed_branches = Array.new(self.branches)
    while !untraversed_branches.empty?
      untraversed_branches.each do |branch|
        yield branch
      end
      untraversed_branches.map! do |branch|
        branch.branches
      end
      untraversed_branches.flatten!.compact!
    end
  end

end
