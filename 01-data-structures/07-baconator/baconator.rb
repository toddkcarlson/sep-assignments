class Node

  attr_reader :name
  attr_accessor :connection  
  
  def initialize(name)
    @name = name
    @connection = []
  end
  
  def add_edge(adjacent_node)
    @connection << adjacent_node
  end
  
end

class Graph

  def initialize
    @nodes = {}
  end
  
  def add_node(node)
    @nodes[node.name] = node
  end
  
  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])
  end

  def find_kevin_bacon(starting_node)
    visited = []
    to_visit = []
    path = []
    # add root node to visited list and to_visit queue
    visited << starting_node
    to_visit << { :node => starting_node, :path => [starting_node.name]}

    while !to_visit.empty?
      current = to_visit.shift
      current_node = current[:node]
      if current_node.name == "Kevin Bacon"
        reutrn current_node.path
      # node not found, add adjacent nodes to be visited if not already
      if current[:path].length <= 6
        current_node.adjacent_nodes.each do |node|
          if !visited.include?(current_node)
            visited << current_node
            to_visit <<  { :node => current_node, :path => current[:path] << current_node.name}
          end
        end
      end
    end
  end
 end
end