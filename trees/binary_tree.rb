class BinaryTree

  attr_accessor :root, :left_child, :right_child

  def initialize(root)
    @root = root
    @left_child = nil
    @right_child = nil
  end

  def insert_left_child(node)
    if @left_child.nil
      @left_child = BinaryTree.new(node)
    else
      left = BinaryTree.new(node)
      left.left_child = @left_child
      @left_child = left
    end
  end

  def insert_right_child(node)
    if @right_child.nil?
      @right_child = BinaryTree.new(node)
    else
      right = BinaryTree.new(node)
      right.right_child = @right_child
      @right_child = right
    end
  end
end
