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

  def insert(value)
    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def delete
  end

  private

  def self.insert!(node, value)
    if node.nil?
      return BSTNode.new(value)
    else
      if value <= node.value
        node.left_child = BinarySearchTree.insert!(node.left_child, value)
      else
        node.right_child = BinarySearchTree.insert!(node.right_child, value)
      end
      return node
    end
  end

  def self.find!(node, value)
    if node.nil?
      return nil
    elsif value == node.value
      return node
    elsif value < node.value
      return BinarySearchTree.find!(node.left_child, value)
    elsif value > node.value
      return BinarySearchTree.find!(node.right_child, value)
    end
  end

  def self.delete_min!(node)
    if node.left_child.nil?
      node_temp = node.right_child
      node.right_child = nil
      node = node_temp
      return node
    else
      return BinarySearchTree.delete_min!(node.left_child)
    end
  end

end
