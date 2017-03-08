require_relative 'binary_tree'
require_relative 'binary_search_tree'

def build_binary_tree(arr)
  bt_arr = []
  arr.each_with_index do |el, i|
    if (i - 1) / 2 >= 0
      if bt_arr[(i - 1) / 2].left_child.nil?
        bt_arr << bt_arr[(i - 1) / 2].insert_left_child(el)
      elsif bt_arr[(i - 1) / 2].right_child.nil?
        bt_arr << bt_arr[(i - 1) / 2].insert_right_child(el)
      end
    else
      bt_arr << BinaryTree.new(el)
    end
  end
  bt_arr[0]
end

bin_tree = build_binary_tree([1, 2, 3, 4, 5, 6])

def build_binary_search_tree(arr)
  root = BSTNode.new(arr[0])
  tree = BinarySearchTree.new(root)
  arr[1..-1].each do |el|
    tree.insert(el)
  end
  tree.root
end

bst = build_binary_search_tree([5, 8, 3, 2, 7, 4, 1])

# Problem 1a : Inorder, preoder and postorder tree traversals

def inorder(node)
  if node.left_child
    inorder(node.left_child)
  end
  puts node.value
  if node.right_child
    inorder(node.right_child)
  end
end

def preorder(node)
  puts node.value
  if node.left_child
    preorder(node.left_child)
  end
  if node.right_child
    preorder(node.right_child)
  end
end

def postorder(node)
  if node.left_child
    postorder(node.left_child)
  end
  if node.right_child
    postorder(node.right_child)
  end
  puts node.value
end

# inorder(bin_tree)
# preorder(bin_tree)
# postorder(bin_tree)

# inorder(bst)
# preorder(bst)
# postorder(bst)

# Problem 2 : Calculate size of a tree

def size(node)
  if node.nil?
    return 0
  elsif node.left_child.nil? && node.right_child.nil?
    return 1
  else
    left_size = size(node.left_child)
    right_size = size(node.right_child)
    return left_size + 1 + right_size
  end
end

# puts size(bin_tree)
# puts size(bst)

# Problem 3 : Calculate height of a tree

def height(node)
  if node.nil?
    return 0
  elsif node.left_child.nil? && node.right_child.nil?
    return 1
  else
    left_height = height(node.left_child)
    right_height = height(node.right_child)
    if left_height >= right_height
      return left_height + 1
    else
      return right_height + 1
    end
  end
end

# puts height(bin_tree)
# puts height(bst)

# Problem 4 : Print all root-to-leaf paths in a tree

def root_to_leaf_paths(node, path)
  if node.nil?
    return
  else
    path << node.value
  end

  if node.left_child.nil? && node.right_child.nil?
    print path
  else
    root_to_leaf_paths(node.left_child, path.dup)
    root_to_leaf_paths(node.right_child, path.dup)
  end
end

# puts root_to_leaf_paths(bin_tree, [])
# puts root_to_leaf_paths(bst, [])

# Problem 5 : Count leabf nodes

def count_leaf_nodes(node)
  if node.nil?
    return 0
  elsif node.left_child.nil? && node.right_child.nil?
    return 1
  else
    left_leaves = count_leaf_nodes(node.left_child)
    right_leaves = count_leaf_nodes(node.right_child)
    return left_leaves + right_leaves
  end
end

# puts count_leaf_nodes(bin_tree)
# puts count_leaf_nodes(bst)

# Problem 6 : Level order traversal

def level_order_traversal(node)
  h = height(node)
  (1..h).each do |n|
    print_given_level(node, n)
  end
end

def print_given_level(node, level)
  if node.nil?
    return
  elsif level == 1
    puts node.value
  else
    print_given_level(node.left_child, level - 1)
    print_given_level(node.right_child, level - 1)
  end
end

# level_order_traversal(bin_tree)
# level_order_traversal(bst)

# Problem 8 : Calculate level of a node

def get_node_level(node, key)
  get_level_of_node(node, key, 1)
end

def get_level_of_node(node, key, level)
  if node.nil?
    return 0
  elsif node.value == key
    return level
  else
    left_level = get_level_of_node(node.left_child, key, level + 1)
    right_level = get_level_of_node(node.right_child, key, level + 1)
    if left_level != 0
      return left_level
    else
      return right_level
    end
  end
end

# puts get_node_level(bin_tree, 3)
# puts get_node_level(bst, 4)

# Problem 7 : Get nodes at distance k from root

def nodes_at_k_distance(node, k)
  h = height(node)
  (1..h).each do |n|
    next if (n - 1) != k
    get_nodes_at_k_distance(node, n)
  end
end

def get_nodes_at_k_distance(node, level)
  if node.nil?
    return
  elsif level == 1
    puts node.value
  else
    get_nodes_at_k_distance(node.left_child, level - 1)
    get_nodes_at_k_distance(node.right_child, level - 1)
  end
end

# alternative solution

def k_distance_nodes(node, k)
  if node.nil?
    return
  elsif k == 0
    puts node.value
  else
    k_distance_nodes(node.left_child, k - 1)
    k_distance_nodes(node.right_child, k - 1)
  end
end

# nodes_at_k_distance(bin_tree, 2)
# nodes_at_k_distance(bst, 3)
# k_distance_nodes(bin_tree, 2)
# k_distance_nodes(bst, 3)

# Problem 9 : Print ancestors of a given node/key

def ancestors(node, key)
  if node.nil?
    return false
  elsif node.value == key
    return true
  end

  if ancestors(node.left_child, key) || ancestors(node.right_child, key)
    puts node.value
    return true
  else
    return false
  end
end

ancestors(bin_tree, 6)
ancestors(bst, 4)
