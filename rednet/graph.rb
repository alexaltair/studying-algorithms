class Graph
  # include Enumerable

  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def edges
    self.nodes.map{|node| node.edges }.flatten.uniq # I have ideas to optimize this, but you know what they say about premature optimization...
  end

  # def each

  # end

  # def breadth_first(&block)
  #   return self.enum_for unless block_given?
  #   ...
  # end

  # def depth_first(&block)
  #   return self.enum_for unless block_given?
  #   ...
  # end

  def connect(node1, node2)
    node1.point_to(node2)
    node2.point_to(node1)
  end


end
