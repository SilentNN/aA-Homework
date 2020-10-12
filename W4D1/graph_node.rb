class GraphNode
    attr_reader :value
    attr_accessor :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end
end
require 'byebug'
def bfs(start, target)
    queue = [start]
    visited = [start]
    until queue.empty?
        shif = queue.shift
        return shif if shif.value == target
        queue += newbies = shif.neighbors.reject { |e| visited.include?(e) }
        visited += newbies
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")

p bfs(a, "f")