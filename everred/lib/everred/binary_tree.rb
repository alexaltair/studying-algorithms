class BinaryTree < Tree

  def left
    self[0]
  end

  def left=(val)
    self[0] = val
  end

  def right
    self[1]
  end

  def right=(val)
    self[1] = val
  end

  TRAVERSAL_ALGORITHMS = Array.new(Tree::TRAVERSAL_ALGORITHMS) << :in_order

  def in_order(&block)
    return self.enum_for unless block_given?
    self.left.post_order(&block)
    yield self
    self.right.post_order(&block)
  end

end
