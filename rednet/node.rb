class Node
  attr_accessor :data
  attr_reader :edges

  def initialize(data)
    @data = data
    @edges = []
  end

  def point_to(node)
    self.edges << node # Change this to an actual edge later
  end

end
