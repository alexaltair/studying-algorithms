class Graph
  # include Enumerable

  attr_accessor :nodes
  attr_reader :edges

  def initialize
    @nodes = []
    @edges = []
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
