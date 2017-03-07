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
  bt_arr
end

def build_binary_search_tree(arr)
  root = BSTNode.new(arr[0])
  tree = BinarySearchTree.new(root)
  arr[1..-1].each do |el|
    tree.insert(el)
  end
  tree.root
end

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

bin_tree = build_binary_tree([1, 2, 3, 4, 5, 6])
inorder(bin_tree[0])
preorder(bin_tree[0])
postorder(bin_tree[0])

# bst = build_binary_search_tree([5, 8, 3, 2, 7, 4, 1])
# inorder(bst)
# preorder(bst)
# postorder(bst)
