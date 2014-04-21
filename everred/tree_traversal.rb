module Traversal
  TRAVERSAL_ALGORITHMS = [
    :breadth_first,
    :depth_first,
    :pre_order,
    :post_order,
  ]

  def each(&block)
    return self.enum_for unless block_given?
    self.pre_order(&block)
  end

  def pre_order(&block)
    return self.enum_for(__method__) unless block_given?
    yield self
    self.branches.each do |branch|
      branch.pre_order(&block)
    end
  end
  alias :depth_first :pre_order

  def post_order(&block)
    return self.enum_for(__method__) unless block_given?
    self.branches.each do |branch|
      branch.post_order(&block)
    end
    yield self
  end

  def breadth_first(&block)
    return self.enum_for(__method__) unless block_given?
    yield self
    untraversed_branches = Array.new(self.branches)
    while !untraversed_branches.empty?
      untraversed_branches.each do |branch|
        yield branch
      end
      untraversed_branches.map!(&:branches).flatten!.compact!
    end
  end

end
