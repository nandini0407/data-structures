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

print build_binary_tree([1, 2, 3, 4, 5, 6])

def build_binary_search_tree(arr)
  bst_arr = []
  arr.each_with_index do |el, i|
    if (i - 1) / 2 >= 0
    else
      root = BSTNode.new(el)
      bst_arr << BinarySearchTree.new(root)
    end
  end
end
