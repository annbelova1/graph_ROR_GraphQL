module Mongoid
    module Graph
      extend ActiveSupport::Concern
  
      included do
        field :node_index, type: Integer
        field :_neighbours, type: Array
  
        after_initialize :generate_mongoid_neighbours
      end
  
      def create_undirected_edge(node)
        unless self._neighbours.include?(node.node_index)
          self._neighbours << node.node_index; self.save
        end
        unless node._neighbours.include?(self.node_index)
          node._neighbours << self.node_index; node.save
        end
      end

      def drop_undirected_edge(node)
        if self._neighbours.include?(node.node_index)
          self._neighbours.delete(node.node_index); self.save
        end
        if self._neighbours.include?(node.node_index)
          node._neighbours.delete(self.node_index); node.save
        end
      end

      def create_directed_edge(node)
        unless self._neighbours.include?(node.node_index)
          self._neighbours << node.node_index
          self.save
        end
      end

      # def drop_directed_edge(node)
      #   self._neighbours.delete(node.node_index) 
      #   self.save
      # end
  
      module ClassMethods
  
        def neighbours_of(node)
          any_in(node_index: node._neighbours.to_a)
        end
  
      end
  
      protected
  
      def generate_mongoid_neighbours
        self._neighbours ||= []
      end
    end
  end