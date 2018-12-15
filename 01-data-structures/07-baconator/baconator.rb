class Node
  attr_reader :name
  attr_accessor :connections  
  
  def initialize(name)
    @name = name
    @connections = []
  end
  
  def connect(adjacent_node)
    @connections << adjacent_node
  end

  def print(node)
    puts node.connections
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
    node1.connect(node2)
    node2.connect(node1)
  end

  def print(nodes)
    nodes.inspect
  end

  def find_kevin_bacon(starting_node)
    visited = []
    to_visit = []
    
    # add root node to visited list and to_visit queue
    visited << starting_node
    to_visit << { :node => starting_node, :path => [starting_node.name]}

    while !to_visit.empty?
      current = to_visit.shift
      current_node = current[:node]
      
      if current_node.name == "Kevin Bacon"
        return current[:path]
      # node not found, add adjacent nodes to be visited if not already
      end
      if current[:path].length < 6
        current_node.connections.each do |node|
          if !visited.include?(node)
            visited << node
            to_visit << { :node => node, :path => current[:path] << node.name}
          end
        end
      
    end
  end
 end
end