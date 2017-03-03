require_relative 'binary_tree'

class Stack

  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def peek
    @store[-1]
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

end

def build_parse_tree(expression)
  start_tree = BinaryTree.new('')
  current_tree = start_tree
  parent_stack = Stack.new
  tokens = expression.split
  tokens.each do |token|
    if token == '('
      current_tree.insert_left_child('')
      parent_stack.push(current_tree)
      current_tree = current_tree.left_child
    elsif !['+', '-', '*', '/'].include?(token)
      current_tree.root = token.to_i
      current_tree = parent_stack.pop
    elsif ['+', '-', '*', '/'].include?(token)
      current_tree.root = token
      current_tree.insert_right_child('')
      parent_stack.push(current_tree)
      current_tree = current_tree.right_child
    elsif token == ')'
      current_tree = parent_stack.pop
    end
  end
  start_tree
end

def evaluate(parse_tree)
  left = parse_tree.left_child
  right = parse_tree.right_child
  if left.nil? && right.nil?
    return parse_tree.root
  else
    operator = parse_tree.root
    parse_left = evaluate(left)
    parse_right = evaluate(right)
    return eval("#{parse_right}#{operator}#{parse_left}")
  end
end

def get_expression(parse_tree)
  expression = ''
  if parse_tree
    expression = '(' + get_expression(parse_tree.left_child)
    expression += parse_tree.root
    expression += get_expression(parse_tree.right_child) + ')'
  end
  expression
end
