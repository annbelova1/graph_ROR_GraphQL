require 'ruby-graphviz'

class Graph  
    attr_reader :graph, :file
    def initialize
        @graph = GraphViz.new( :G, :type => :digraph )
        @file = File.new("#{Rails.root}/graph1.png", "w")
    end
    
    def call
        Node.not.where(node_index: nil).order(:node_index.asc).to_a.each do |node|
            node._neighbours.compact.each do |index| 
                graph.add_edge(node.node_index, index) if node.node_index != index 
            end
        end

        graph.print_dotted_on
    end 

    def record_to_file        
        Node.not.where(node_index: nil).order(:node_index.asc).to_a.each do |node|
            graph.add_nodes(node.node_index.to_s)
            node._neighbours.compact.each do |index| 
                graph.add_edges(node.node_index.to_s, index.to_s) if node.node_index != index 
            end
        end

        graph.output(png: file)
    end
end
  