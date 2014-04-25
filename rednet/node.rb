class Node
  attr_accessor :data
  attr_reader :edges

  def initialize(data)
    @data = data
    @edges = []
  end

  def point_to(node)
    self.edges << Edge.new(self, node)
  end

  def neighbors
    self.edges.map(&:to_node)
  end

end
