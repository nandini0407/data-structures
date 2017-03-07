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

  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(value)
    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left_child = BinarySearchTree.insert!(node.left_child, value)
    else
      node.right_child = BinarySearchTree.insert!(node.right_child, value)
    end
    return node
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
      node_to_delete = node
      node = node_temp
      return node_to_delete
    else
      return BinarySearchTree.delete_min!(node.left_child)
    end
  end

  def self.delete!(node, value)
    if value == node.left_child
      node_to_delete = node.left_child
      if node_to_delete.left_child.nil? && node_to_delete.right_child.nil?
        node.left_child = nil
      elsif node_to_delete.left_child.nil? && node_to_delete.right_child
        node.left_child = node_to_delete.right_child
      elsif node_to_delete.right_child.nil? && node_to_delete.left_child
        node.left_child = node_to_delete.left_child
      elsif node_to_delete.left_child && node_to_delete.right_child
        min = BinarySearchTree.delete_min!(node_to_delete.right_child)
        left = node_to_delete.left_child
        right = node_to_delete.right_child
        node.left_child = min
        min.left_child = left
        min.right_child = right
      end
      return node_to_delete
    elsif value == node.right_child
      node_to_delete = node.right_child
      if node_to_delete.left_child.nil? && node_to_delete.right_child.nil?
        node.right_child = nil
      elsif node_to_delete.left_child.nil? && node_to_delete.right_child
        node.right_child = node_to_delete.right_child
      elsif node_to_delete.right_child.nil? && node_to_delete.left_child
        node.right_child = node_to_delete.left_child
      elsif node_to_delete.left_child && node_to_delete.right_child
        min = BinarySearchTree.delete_min!(node_to_delete.right_child)
        left = node_to_delete.left_child
        right = node_to_delete.right_child
        node.right_child = min
        min.left_child = left
        min.right_child = right
      end
      return node_to_delete
    elsif value < node.value
    elsif value > node.value
    end
  end

end
