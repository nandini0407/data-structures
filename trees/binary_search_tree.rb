class BSTNode
  attr_accessor :left_child, :right_child
  attr_reader :value

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert
  end

  def delete
  end

end
