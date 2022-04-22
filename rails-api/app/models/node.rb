class Node  
  include Mongoid::Document
  include Mongoid::Graph
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  validates_presence_of :node_index
  validates_uniqueness_of :node_index
end

# 10.times { |i| Node.create(node_index: i + 1) }