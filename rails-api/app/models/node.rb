class Node  
  include Mongoid::Document
  include Mongoid::Graph
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  validates_uniqueness_of :node_index
  before_validation :set_node_index

  def set_node_index
    self.node_index = Node.last&.node_index.to_i + 1 unless self.node_index
  end
end

# 10.times { |i| Node.create(node_index: i + 1) }